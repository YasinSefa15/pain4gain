import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverWorkoutsComponent extends StatefulWidget {
  final BoxConstraints constraints;
  const DiscoverWorkoutsComponent({Key? key, required this.constraints}) : super(key: key);
  @override
  DiscoverWorkoutsComponentState createState() => DiscoverWorkoutsComponentState();
}

class DiscoverWorkoutsComponentState extends State<DiscoverWorkoutsComponent> {
  int stepCount = 0;
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    loadStepCount();
    startListening();
  }

  void loadStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedStepCount = prefs.getInt('stepCount') ?? 0;
    DateTime savedDate = DateTime.fromMillisecondsSinceEpoch(prefs.getInt('date') ?? DateTime.now().millisecondsSinceEpoch);
    DateTime currentDate = DateTime.now();

    if (currentDate.year != savedDate.year || currentDate.month != savedDate.month || currentDate.day != savedDate.day) {
      setState(() {
        stepCount = 0;
      });
      prefs.setInt('stepCount', 0);
      prefs.setInt('date', currentDate.millisecondsSinceEpoch);
    } else {
      setState(() {
        stepCount = savedStepCount;
      });
    }
  }

  void startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x > 10.0 || event.y > 10.0 || event.z > 10.0) {
        setState(() {
          stepCount++;
        });
        _saveStepCount();
      }
    });
    setState(() {
      isListening = true;
    });
  }

  void stopListening() {
    setState(() {
      isListening = false;
    });
  }

  void _saveStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('stepCount', stepCount);
    prefs.setInt('date', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(

      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: screenHeight / 3.5,
        width: screenWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
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
                      0.9
                    ],
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.1)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.directions_run,
                        size: 40,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Step Counter",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("You took", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$stepCount",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(children: [
                                    Text(
                                      " Steps",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ],
                              ),
                              Text("today", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(width: 20,),
                          Image(
                            image: AssetImage("assets/jogging.png"),
                            width: 100,
                            height: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
