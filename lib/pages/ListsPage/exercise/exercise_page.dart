import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String workoutTitle;
  final Color workoutColor;
  final List<dynamic> workoutList;
  final String filePath;

  const ExercisePage(
      {super.key,
      required this.workoutTitle,
      required this.workoutColor,
      required this.workoutList,
      required this.filePath});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Düğme tıklandığında gerçekleşecek işlemler
                  Navigator.pop(context);
                },
                child: Text('Bitir'),
              ),

            ],
          )),
        ));
  }
}
