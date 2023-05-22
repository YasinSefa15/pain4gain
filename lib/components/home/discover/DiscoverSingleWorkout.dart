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

    return Container(
      width: screenWidth * 0.6,
      height: screenWidth * 0.4,
      color: Colors.green,
      margin: const EdgeInsets.all(8),
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
                    style: const TextStyle(
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
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
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
                width: screenWidth * 0.3,
                height: screenWidth * 0.2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
