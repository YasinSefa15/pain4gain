import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/user_workout_list_tile.dart';
import 'package:pain4gain/pages/ListsPage/exercise/user_exercise_page.dart';

class UserWorkoutPage extends StatefulWidget{
  final Map<String, dynamic> exercise;
  final Color givenColor;

  const UserWorkoutPage({
    Key? key,
    required this.exercise, required this.givenColor,
  }) : super(key: key);

  @override
  _UserWorkoutPageState createState() => _UserWorkoutPageState();

}


class _UserWorkoutPageState extends State<UserWorkoutPage>{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise["title"]),
        backgroundColor: widget.givenColor,
      ),
      body: Column(
        children: [
          GestureDetector(
            //on click open exercise page
            onTap: () {
              print(widget.exercise.runtimeType);
              print(widget.exercise);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    UserExercisePage(workoutTitle: 'Exercise',
                      workoutColor: widget.givenColor,
                      workoutList: widget.exercise["workouts"],
                    )
                )
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green

              ),
              //color: Colors.green,
              width: screenWidth * 0.22,
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.exercise['workouts'].length,
              itemBuilder: (context, index) {
                print(widget.exercise['workouts'][index]);
                print(index);
                return UserWorkoutListTile(
                    name: widget.exercise['workouts'][index]['name'],
                    instructions: widget.exercise['workouts'][index]['instructions'],
                    primaryMuscles: widget.exercise['workouts'][index]['primaryMuscles'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}