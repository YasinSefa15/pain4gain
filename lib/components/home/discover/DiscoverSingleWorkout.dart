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
    return Container(
      width: 270,
      height: 180,
      color: Colors.green,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        //ALL AREA
        children: [
          Column(
            // LEFT AREA
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    exerciseCount,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "Exercises",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
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
                    "Minutes",
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

            children: [
              Image(
                image: AssetImage(
                    imagePath == "" ? "assets/jogging.png" : imagePath),
                width: 100,
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
