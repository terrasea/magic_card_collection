import 'dart:async';
import 'dart:convert';
import 'package:lawndart/lawndart.dart';
import 'package:polymer/polymer.dart';

@CustomTag('db-connector')
class DBConnector extends PolymerElement {
  @published List<Map<String, String>> collection;
  @published String name;
  @published String store;
  @published String key;
  Store _db;


  DBConnector.created() : super.created() {
    _db = new Store(name, store);
  }


  @override
  void enteredView(){
    _db.open().then((_){
      _load().then((value) {
        if(value != false) {
          _attachChangeListener();
        }
      });

    });
  }


  Future _contains(Map<String, String> item) {
    if(_db.isOpen) {
      return _db.exists(item[key]);
    } else {
      return new Future(() => false);
    }
  }

  void _attachChangeListener() {
    collection.listChanges.listen((List<ListChangeRecord> changes) {
      print("changed: " + changes.toString());
      changes.forEach((change) {
        if(change.addedCount > 0) {
          _contains(collection[change.index]).then((exists) {
            if(exists == false) {
              _add(collection[change.index]);
            }
          });


        } else if(change.removed.length > 0) {
          change.removed.forEach((item) {
            _remove(item);
          });
        }
      });
    });
  }

  void _add(Map<String, String> item) {
    String jsonVal = JSON.encode(item);
    if(_db.isOpen) {
      _db.save(jsonVal, item[key]);
    }
  }


  void _remove(Map<String, String> item) {
    if(_db.isOpen) {
      _db.removeByKey(item[key]);
    }
  }


  Future _load() {
    if(_db.isOpen) {
      return _db.keys().forEach((item) {
        _db.getByKey(item).then((item){
          Map<String, String> val = JSON.decode(item);
          collection.add(val);
          print("loaded " + val.toString());
        });
      });
    }

    return new Future(() => false);
  }
}