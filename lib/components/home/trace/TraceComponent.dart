import 'package:flutter/material.dart';


class TraceComponent extends StatelessWidget {
  final BoxConstraints constraints;
  const TraceComponent({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      //decoration: BoxDecoration(),
      padding: EdgeInsets.all(15),
      constraints: BoxConstraints(
        minWidth: constraints.minWidth,
        maxWidth: constraints.maxWidth,
        minHeight: constraints.minHeight,
        maxHeight: constraints.maxHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: screenHeight / 3,
              width: screenWidth / 2 - 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fitness_girl.png"),
                      alignment: Alignment.bottomCenter,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(115, 85, 230, 100),
                        Color.fromRGBO(210, 121, 247, 100)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: [
                            0.2,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.1)
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.fitness_center,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Finished",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "2.0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(children: [
                              Text(
                                "Complete",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "Workout",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: screenHeight / 6 - 2.5,
                  width: screenWidth / 2 - 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/fitness_man.png"),
                          alignment: Alignment.bottomCenter,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(85, 131, 238, 100),
                            Color.fromRGBO(65, 216, 221, 100)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.2,
                                0.7
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.1)
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.fitness_center,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "In Progress",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "2.0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(children: [
                                  Text(
                                    "Workouts",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: screenHeight / 6 - 2.5,
                  width: screenWidth / 2 - 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/fitness_couple.png"),
                          alignment: Alignment.bottomCenter,
                        ),
                        gradient: LinearGradient(
                          end: Alignment.bottomLeft,
                          begin: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(196, 231, 89, 100),
                            Color.fromRGBO(109, 225, 149, 100)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.2,
                                0.7
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.1)
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.fitness_center,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Time Spend",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "25",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(children: [
                                  Text(
                                    "Minutes",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
