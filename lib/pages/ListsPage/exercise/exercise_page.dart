import 'package:flutter/material.dart';

import '../../../components/lists/exercise/current_exercise.dart';

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
    int exerciseIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Düğme tıklandığında gerçekleşecek işlemler
                        Navigator.pop(context);
                      },
                      child: Text('End Program'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // background
                        foregroundColor: Colors.white, // foreground
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (exerciseIndex < widget.workoutList.length - 1) {
                          print(exerciseIndex);
                          print("length: ${widget.workoutList.length}");
                            exerciseIndex = exerciseIndex + 1;
                          }
                        });
                        // Düğme tıklandığında gerçekleşecek işlemler
                        //Navigator.pop(context);
                      },
                      child: Text('Next Exercie'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // background
                        foregroundColor: Colors.white, // foreground
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              CurrentExercise(
                exerciseTitle: widget.workoutList[exerciseIndex]['name'],
                exerciseImagePath: widget.workoutList[exerciseIndex]['gif'],
                exerciseList: widget.workoutList[exerciseIndex]['instructions'],
              ),
            ],
          )),
        ));
  }
}
