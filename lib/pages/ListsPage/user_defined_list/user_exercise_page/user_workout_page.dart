import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/user_workout_list_tile.dart';
import 'package:pain4gain/json/ListJsonController.dart';
import 'package:pain4gain/pages/ListsPage/exercise/user_exercise_page.dart';

class UserWorkoutPage extends StatefulWidget {
  final Map<String, dynamic> exercise;
  final Color givenColor;

  const UserWorkoutPage({
    Key? key,
    required this.exercise,
    required this.givenColor,
  }) : super(key: key);

  @override
  _UserWorkoutPageState createState() => _UserWorkoutPageState();
}

class _UserWorkoutPageState extends State<UserWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ListJsonController listJsonController = ListJsonController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise["title"]),
        backgroundColor: widget.givenColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                //color: Colors.green,
                width: screenWidth * 0.3,
                child: GestureDetector(
                  onTap: () async => {
                    print(widget.exercise['title']),
                    await listJsonController
                        .removeUserWorkoutList(widget.exercise['title']),
                    Navigator.pop(context)
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          size: screenWidth * 0.05,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                //on click open exercise page
                onTap: () {
                  //print(widget.exercise.runtimeType);
                  //print(widget.exercise);
                  if (widget.exercise['wworkouts'] != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserExercisePage(
                                  workoutTitle: 'Exercise',
                                  workoutColor: widget.givenColor,
                                  workoutList: widget.exercise["workouts"],
                                )));
                  }
                },
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        //color: Colors.green,
                        width: screenWidth * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: screenWidth * 0.05,
                              ),
                              Text(
                                "Start",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.exercise['workouts'].length,
              itemBuilder: (context, index) {
                print(widget.exercise['workouts'][index]);
                print(index);
                return UserWorkoutListTile(
                  imageGif: widget.exercise['workouts'][index]['gif'],
                  name: widget.exercise['workouts'][index]['name'],
                  instructions: widget.exercise['workouts'][index]
                      ['instructions'],
                  primaryMuscles: widget.exercise['workouts'][index]
                      ['primaryMuscles'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
