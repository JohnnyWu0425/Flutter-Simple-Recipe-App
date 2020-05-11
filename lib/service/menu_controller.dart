import 'package:flutter/material.dart';
import 'package:recipeapp/widget/food_menu.dart';
import 'package:recipeapp/widget/snacks_menu.dart';
import 'package:recipeapp/widget/dessert_menu.dart';
import 'package:recipeapp/widget/drinks_menu.dart';
import 'package:recipeapp/widget/fruit_menu.dart';



class MenuController extends StatelessWidget {

  final String menuName;

  MenuController({this.menuName});

  @override
  Widget build(BuildContext context) {

    if(menuName == "Food"){
      return FoodMenu();
    }


    else if(menuName == "Snacks") {
      return SnacksMenu();
    }

    else if(menuName == "Dessert") {
      return DessertMenu();
    }

    else if(menuName == "Drink") {
      return DrinksMenu();
    }

    else if(menuName == "Fruit") {
      return FruitMenu();
    }

    return Text("Not yet");
  }
}
