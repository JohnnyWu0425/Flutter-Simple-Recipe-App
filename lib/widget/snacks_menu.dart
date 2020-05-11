import 'package:flutter/material.dart';

class SnacksMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        height: 480,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 180,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/snacksmenu/cookies.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Cookies",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    )
                ),

                SizedBox(
                  height: 15,
                ),

                Expanded(
                    flex: 1,
                    child: Container(
                      width: 180,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/snacksmenu/croissant.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Sushi",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),

            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 180,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/snacksmenu/macarons.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Macarons",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    )
                ),

                SizedBox(
                  height: 15,
                ),

                Expanded(
                    flex: 1,
                    child: Container(
                      width: 180,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/snacksmenu/nuts.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Nuts",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
