import 'package:polymer/polymer.dart';

import 'dart:html';


@CustomTag('card-collection')
class CardCollection extends PolymerElement {

  final List<Map> cards = toObservable([]);



  CardCollection.created() : super.created() {


  }



  void add(Event e) {
    cards.add(e.detail['value']);
  }


  void delete(Event e) {
    cards.removeWhere((item) => item['card'] == e.detail);
  }
}