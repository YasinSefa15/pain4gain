import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutType extends StatelessWidget {
  final String imagePath;

  const WorkoutType({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 30,
      height: 30,
      color: Colors.blue,
      child: Image.asset(
        imagePath,
        width: 10,
        height: 10,
      ),
    );
  }
}
