import 'package:polymer/polymer.dart';

import "dart:html";

/**
 * A Polymer modal dialog element.
 */
@CustomTag('modal-dialog')
class ModalDialog extends PolymerElement {
  @published String id;
  Element background;
  Element content;

  ModalDialog.created() : super.created() {

  }

  @override
  void enteredView(){
    super.enteredView();
    background = $["dialogbackground"];
    content = $["dialogcontent"];
    hide();
  }

  void show() {
    background.style.display = 'block';
    content.style.display = 'block';
  }


  void hide() {
    background.style.display = 'none';
    content.style.display = 'none';
  }
}