import 'package:flutter/material.dart';

class DiscoverSingleWorkout extends StatelessWidget {
  final String title;
  final String exerciseCount;
  final String time;
  final String imagePath;

  const DiscoverSingleWorkout(
      {Key? key,
        required this.title,
        required this.exerciseCount,
        required this.time,
        required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      //width: double.infinity,
        decoration: BoxDecoration(),
        padding: EdgeInsets.only(right: 10, top: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: screenHeight / 4,
                  width: screenWidth / 1.5,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            end: Alignment.bottomLeft,
                            begin: Alignment.topRight,
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
                                  0.7
                                ],
                                colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.1)
                                ])),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Row(children: [
                                      Text(
                                        exerciseCount,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        " Exercises",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ]),
                                    Row(
                                      children: [
                                        Text(
                                          time,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          " Minutes",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(imagePath == ""
                                          ? "assets/jogging.png"
                                          : imagePath),
                                      width: 100,
                                      height: 100,
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      )))
            ]));
  }
}
