import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutTitle;
  final String workoutColor;

  const WorkoutPage(
      {super.key, required this.workoutTitle, required this.workoutColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutTitle),
        backgroundColor: Color(int.parse(workoutColor)),
      ),
      body: Container(
          // İkinci sayfanın içeriği
          ),
    );
  }
}
