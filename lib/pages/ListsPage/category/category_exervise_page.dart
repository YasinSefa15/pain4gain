

import 'package:flutter/material.dart';

class CategoryExercisePage extends StatelessWidget{
  final String exerciseTitle;
  const CategoryExercisePage({super.key, required this.exerciseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseTitle),
      ),
      body: Center(
        child: Text("Category Exercise Page"),
      ),
    );
  }

}