import 'package:polymer/polymer.dart';

import "dart:html";

@CustomTag('create-card')
class CreateCard extends PolymerElement {
  @published String card;
  @published String type;
  @published String cost; //"1UU" is 1 of any colour and 2 blue
  @published String power;
  @published String toughness;
  @published String description; //outline of what the card does, not the flavour text
  @published String picture;

  Element background;
  Element content;

  CreateCard.created() : super.created() {

  }


  @override
  void enteredView(){
    super.enteredView();
    shadowRoot.applyAuthorStyles = true;
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

  void save(Event e, var detail, var target) {
    hide();
    fire("update", detail: {'key': card, 'value' : {'card': card, 'type': type, 'cost': cost, 'power': power, 'toughness': toughness, 'description': description}});
  }


}
