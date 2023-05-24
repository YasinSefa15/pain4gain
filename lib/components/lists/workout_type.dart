import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutType extends StatelessWidget {
  final IconData icon;
  const WorkoutType({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 30,
      height: 30,
      color: Colors.blue,
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
