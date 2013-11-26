import 'package:polymer/polymer.dart';

import "dart:html";

@CustomTag('magic-card')
class MagicCard extends PolymerElement {
  @published String card;
  @published String type;
  @published String cost; //"1UU" is 1 of any colour and 2 blue
  @published String power;
  @published String toughness;
  @published String description; //outline of what the card does, not the flavour text
  @published String picture;

  Element delEl;

  MagicCard.created() : super.created(){
    //setup non-display values here
  }


  @override
  void enteredView(){
    //do any display alterations and connections to UI elements here
  }


  void delete(Event e, var detail, var target) {
    fire("delete", detail: card);
  }
}