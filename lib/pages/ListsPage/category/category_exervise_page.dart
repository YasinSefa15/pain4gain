

import 'package:flutter/material.dart';

class CategoryExercisePage extends StatelessWidget{
  final String exerciseTitle;
  final List workouts;
  const CategoryExercisePage({super.key, required this.exerciseTitle, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseTitle),
      ),
      body: Center(
        child: Text(workouts.toString()),
      ),
    );
  }

}