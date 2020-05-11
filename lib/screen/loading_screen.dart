import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeapp/service/data_processor.dart';
import 'package:recipeapp/screen/recipe_screen.dart';

class LoadingScreen extends StatefulWidget {

  final String searchStr;
  LoadingScreen({this.searchStr});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  Future<void> processData() async{
    DataProcessor dp = DataProcessor(widget.searchStr);
    bool result = await dp.requestData();
    if(result)
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => RecipeScreen(data: dp.finalData, searchStr: widget.searchStr,)));
    else
      Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    processData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCircle(
          duration: Duration(milliseconds: 1000),
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}
