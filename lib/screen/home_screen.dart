import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipeapp/model/icon_model.dart';
import 'package:recipeapp/service/menu_controller.dart';
import 'package:recipeapp/screen/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int boughtItems = 0;
  bool isSearchFieldFocused = false;
  FocusNode focusNodeController = FocusNode();
  int tabMenuIdx = 0;


  @override
  void initState() {
    super.initState();
    focusNodeController.addListener((){
      isSearchFieldFocused = focusNodeController.hasFocus ? true:false;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: ListView(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Icon(
                    Icons.fastfood,
                    color: Color.fromRGBO(255, 87, 0, 1),
                    size: 55,
                  ),

                  SizedBox(
                    width: 100,
                  ),

                  Stack(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 87, 0, 1),
                          borderRadius: BorderRadius.circular(16.0),
                        ),

                      ),

                      Positioned(
                        left: 13,
                        top: 14,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      Positioned(
                        right: 13,
                        top: 16,
                        child: Text(
                          "$boughtItems",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),

                Stack(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      top: 14,
                      child: Icon(
                        Icons.search,
                        size: 35,
                        color: isSearchFieldFocused? Colors.blue[300]:Colors.grey[600],
                      ),
                    ),

                    Positioned(
                      top: 5,
                      left: 70,
                      child: Container(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                            ),
                          ),
                          maxLength: 30,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          autocorrect: true,
                          focusNode: focusNodeController,
                          onSubmitted: (String str) {
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context) => LoadingScreen(searchStr: str)
                            ));
                          },
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  width: 10,
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),

                Container(
                  width: 374,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0),
                    itemCount: icons.length,
                    itemBuilder: (context, idx){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            tabMenuIdx = idx;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            width: 70,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 75,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: idx==tabMenuIdx? Colors.black:Colors.grey[200],
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      icons[idx].iconData,
                                      color: idx==tabMenuIdx? Colors.white:Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "${icons[idx].name}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                      );
                    },
                  )
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),

                Text(
                  "${icons[tabMenuIdx].name} Menu",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                )
              ],
            ),

            MenuController(menuName: icons[tabMenuIdx].name),
          ],
        ),
      ),

      // bottomNavigationBar: ,

    );
  }
}
