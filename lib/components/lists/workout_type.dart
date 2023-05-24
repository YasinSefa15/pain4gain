import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutType extends StatelessWidget {
  const WorkoutType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 30,
      height: 30,
      color: Colors.blue,
      child: const Icon(
        Icons.favorite,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
