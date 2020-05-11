import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeScreen extends StatefulWidget {
  final Map data;
  final String searchStr;
  RecipeScreen({this.data, this.searchStr});

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isListView = true;

  int currentTabIdx = 0;
  List<String> tabName = [
    "All Food",
    "Popular Sale",
    "New Item",
    "Hot Sale",
  ];

  int currentListIdx = 0;

  Widget cvtStr2Text(String str)
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "→",
              style: TextStyle(
                color: Color.fromRGBO(255, 87, 0, 1),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),

            TextSpan(
              text: " ",
            ),

            TextSpan(
              text: "$str",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      border: Border.all(color: Colors.grey[300]),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                      iconSize: 40,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Text(
                  "${widget.searchStr[0].toUpperCase()}${widget.searchStr.substring(1)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.format_list_bulleted,
                        color:
                            (isListView) ? (Colors.black) : (Colors.grey[400]),
                        size: 25,
                      ),
                      onTap: () {
                        setState(() {
                          isListView = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.grid_on,
                        color:
                            (!isListView) ? (Colors.black) : (Colors.grey[400]),
                        size: 25,
                      ),
                      onTap: () {
                        setState(() {
                          isListView = false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Container(
              height: 40,
              width: 390,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(0.0),
                itemCount: tabName.length,
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTabIdx = idx;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${tabName[idx]}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: (currentTabIdx == idx)
                                  ? (Colors.black)
                                  : (Colors.grey[400]),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 10,
                            color: (currentTabIdx == idx)
                                ? (Colors.orange)
                                : (Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 681,
                  //color: Colors.red[100],
                  child: ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.data["num"],
                    itemBuilder: (context, idx) {
                      return GestureDetector(
                        onTap: () {
                          print(widget.data["ingredient"][currentListIdx]);
                          setState(() {
                            currentListIdx = idx;
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: CachedNetworkImage(
                              imageUrl: "${widget.data["image"][idx]}",
                              imageBuilder: (context, img) {
                                return Container(
                                  height: 85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: img,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: (currentListIdx == idx)
                                            ? (Colors.grey[500])
                                            : (Colors.transparent),
                                        spreadRadius: 2.0,
                                        blurRadius: 5.0,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),),
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  height: 681,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: "${widget
                                      .data["image"][currentListIdx]}",
                                  imageBuilder: (context, img) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 25.0),
                                      child: Container(
                                        height: 250,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: img,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              18.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[500],
                                              spreadRadius: 2.0,
                                              blurRadius: 5.0,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                SizedBox(
                                  width: 20,
                                ),

                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.data["isFavorite"][currentListIdx] = !widget.data["isFavorite"][currentListIdx];
                                    });
                                  },
                                  child: Icon(
                                    (widget.data["isFavorite"][currentListIdx]) ? (Icons.favorite) : (Icons
                                        .favorite_border),
                                    size: 30,
                                    color: (widget.data["isFavorite"][currentListIdx]) ? (Colors.red) : (Colors
                                        .grey[700]),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 25.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              child: Text(
                                "${widget.data["name"][currentListIdx]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text(
                                "Weight - ${widget
                                    .data["weight"][currentListIdx]} g",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 25.0,
                                  top: 10.0,
                                  bottom: 20.0),
                              child: RichText(
                                text: TextSpan(
                                    children: [

                                      TextSpan(
                                        text: "${widget
                                            .data["calories"][currentListIdx]}",
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 87, 0, 1),
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      TextSpan(
                                        text: "     ",
                                      ),

                                      TextSpan(
                                        text: "cal",
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 87, 0, 1),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 25.0,
                                  bottom: 10.0),
                              child: Text(
                                "Ingredients :",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 10.0, bottom: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (widget
                                    .data["ingredient"][currentListIdx]).map<
                                    Widget>(cvtStr2Text).toList(),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

