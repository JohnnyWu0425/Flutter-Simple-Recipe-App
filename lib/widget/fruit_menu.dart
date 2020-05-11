import 'package:flutter/material.dart';

class FruitMenu extends StatelessWidget {

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
                                      image: AssetImage("assets/fruitmenu/apple.jpg"),
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
                                "Apple",
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
                                      image: AssetImage("assets/fruitmenu/orange.jpg"),
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
                                "Orange",
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
                                      image: AssetImage("assets/fruitmenu/cherry.jpg"),
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
                                "Cherry",
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
                                      image: AssetImage("assets/fruitmenu/strawberry.jpg"),
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
                                "Strawberry",
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
