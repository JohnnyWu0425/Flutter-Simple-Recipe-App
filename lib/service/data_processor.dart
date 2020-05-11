import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataProcessor
{
  String applicationID = "6179bd83";
  String applicationKEY = "faffe71f6affd38766b08c76a1acace5";
  String url;
  String search;
  Map finalData = Map();

  DataProcessor(String search){
    this.search = search;
    url = "https://api.edamam.com/search?q=$search&app_id=$applicationID&app_key=$applicationKEY";
  }

  Future<bool> requestData() async{

    try{
      dynamic res = await http.get(url).timeout(Duration(seconds: 55));
      print("get data !");
      processData(convert.jsonDecode(res.body));
      return true;

    } on TimeoutException catch(e){
      print("timeout !");
      return false;
    }

  }

  void processData(Map data){
    print("DEBUG => start to process data");

    int recipeNum = data["hits"].length;
    List<String> images = [];
    List<String> names = [];
    List<int> weights = [];
    List<int> calories = [];
    List<bool> flags = [];
    List<List<String>> ingredientLines = [];

    print("DEBUG => number of recipe = $recipeNum");

    for(var hit in data["hits"]){
      Map recipe = hit["recipe"];

      bool collected = true;
      for(var str in recipe["ingredientLines"]){
        if(str.contains('http')) {
          collected = false;
          break;
        }
      }

      if(!collected) {
        recipeNum -= 1;
        continue;
      }

      images.add(recipe["image"]);
      names.add(recipe["label"]);
      weights.add(recipe["totalWeight"].round());
      calories.add(recipe["calories"].round());
      flags.add(false);

      List<String> temp = [];
      for(var str in recipe["ingredientLines"]){
        temp.add(str);
      }

      ingredientLines.add(temp);
    }

    print("DEBUG => start to store data !");
    print("DEBUG => number of recipe = $recipeNum");

    finalData["num"] = recipeNum;
    finalData["image"] = images;
    finalData["name"] = names;
    finalData["weight"] = weights;
    finalData["calories"] = calories;
    finalData["ingredient"] = ingredientLines;
    finalData["isFavorite"] = flags;

    print("DEBUG => successfully process data");
  }
}