import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconModel
{
  String name;
  dynamic iconData;

  IconModel({this.name, this.iconData});
}

List<IconModel> icons = [
  IconModel(name: "Food", iconData: FontAwesomeIcons.hamburger),
  IconModel(name: "Snacks", iconData: FontAwesomeIcons.birthdayCake),
  IconModel(name: "Dessert", iconData: FontAwesomeIcons.iceCream),
  IconModel(name: "Drink", iconData: FontAwesomeIcons.wineBottle,),
  IconModel(name: "Fruit", iconData: FontAwesomeIcons.apple,),
];