import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final startTime = DateTime.now(); // Başlangıç zamanını kaydedin

   // Bitiş zamanını kaydedin

  // Zaman farkını hesaplayın



  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Well Done!'),
          content: Text('You Successfully Completed the Exercise!'),
          actions: [
            TextButton(
              child: Text('Return to Main Page'),
              onPressed: () {
                // Popup'ta Tamam butonuna basıldığında yapılacak işlemler
                final endTime = DateTime.now();
                final duration = endTime.difference(startTime);
                _saveCompletedWorkoutData(duration.inMinutes).then((_) {

                  // Close the dialog and navigate back twice
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
                //todo: kalori hesabı buradan eklenecek shared pref eklenecek
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String nextStep = "Next Exercise";
    setState(() {
      if (exerciseIndex == widget.workoutList.length - 1) {
        nextStep = "Finish Exercise";
      }
    });

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
                    Text("${exerciseIndex + 1}/${widget.workoutList.length}"),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (exerciseIndex < widget.workoutList.length - 1) {
                            exerciseIndex = exerciseIndex + 1;
                          }

                          if (nextStep == "Finish Exercise"){
                            _showPopupDialog(context);
                          }
                        });
                        // Düğme tıklandığında gerçekleşecek işlemler
                        //Navigator.pop(context);
                      },
                      child: Text(nextStep),
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
  Future<void> _saveCompletedWorkoutData(final duration) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int completedWorkouts = (prefs.getInt('completedWorkouts') ?? 0) + 1;
    await prefs.setInt('completedWorkouts', completedWorkouts);

    int totalWorkoutTime = duration; // Calculate total workout time in seconds
    await prefs.setInt('workoutTime', totalWorkoutTime);
  }
}
