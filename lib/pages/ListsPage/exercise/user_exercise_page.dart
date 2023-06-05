import 'package:flutter/material.dart';

import '../../../components/lists/exercise/current_exercise.dart';

class UserExercisePage extends StatefulWidget {
  final String workoutTitle;
  final Color workoutColor;
  final List<dynamic> workoutList;

  const UserExercisePage(
      {super.key,
        required this.workoutTitle,
        required this.workoutColor,
        required this.workoutList,
      });

  @override
  State<UserExercisePage> createState() => _UserExercisePageState();
}

class _UserExercisePageState extends State<UserExercisePage> {
  int exerciseIndex = 0;

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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
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
}
