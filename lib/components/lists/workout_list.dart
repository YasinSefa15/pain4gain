import 'package:flutter/cupertino.dart';

class WorkoutList extends StatelessWidget {
  final Color color;
  final double desiredWidth;
  final String title;
  final String imagePath;
  const WorkoutList({Key? key, required this.color, required this.desiredWidth, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      width: desiredWidth,
      height: 250,
      margin: const EdgeInsets.all(10),
      //generate random color
      color: color,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    );
  }
}