import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/lists/exercise/current_exercise.dart';

class UserExercisePage extends StatefulWidget {
  final String workoutTitle;
  final Color workoutColor;
  final List<dynamic> workoutList;

  const UserExercisePage({
    Key? key,
    required this.workoutTitle,
    required this.workoutColor,
    required this.workoutList,
  }) : super(key: key);

  @override
  State<UserExercisePage> createState() => _UserExercisePageState();
}

class _UserExercisePageState extends State<UserExercisePage> {
  int exerciseIndex = 0;
  Stopwatch stopwatch = Stopwatch();
  String formattedTime = '00:00';
  Timer? timer;
  bool isTimerRunning = false;
  int workoutTime = 0;
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      workoutTime = (prefs?.getInt('workoutTime') ?? 0); // Get workoutTime as seconds
    });
  }

  void _showPopupDialog(BuildContext context) {
    stopwatch.stop();
    timer?.cancel();
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
                // Increment completedWorkouts by 1 and save to SharedPreferences
                _saveCompletedWorkoutData().then((_) {
                  // Close the dialog and navigate back twice
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
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

                          if (nextStep == "Finish Exercise") {
                            _showPopupDialog(context);
                          }
                        });
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
          ),
        ),
      ),
    );
  }

  Future<void> _saveCompletedWorkoutData() async {
    int completedWorkouts = (prefs?.getInt('completedWorkouts') ?? 0) + 1;
    await prefs?.setInt('completedWorkouts', completedWorkouts);

    int totalWorkoutTime = (workoutTime + stopwatch.elapsed.inSeconds)~/60; // Calculate total workout time in seconds
    await prefs?.setInt('workoutTime', totalWorkoutTime);
  }
}
