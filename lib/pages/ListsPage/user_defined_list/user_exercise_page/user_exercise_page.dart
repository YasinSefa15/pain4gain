import 'package:flutter/material.dart';

class UserExercisePage extends StatefulWidget{
  final Map<String, dynamic> exercise;
  final Color givenColor;

  const UserExercisePage({
    Key? key,
    required this.exercise, required this.givenColor,
  }) : super(key: key);

  @override
  _UserExercisePageState createState() => _UserExercisePageState();

}


class _UserExercisePageState extends State<UserExercisePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise["title"]),
        backgroundColor: widget.givenColor,
      ),
      body: Text(widget.exercise.toString()),
    );
  }
}