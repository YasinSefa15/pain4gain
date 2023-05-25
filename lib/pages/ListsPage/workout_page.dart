import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/workout_list_tile.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutTitle;
  final String workoutColor;
  final List<dynamic> workoutList;

  const WorkoutPage(
      {super.key,
      required this.workoutTitle,
      required this.workoutColor,
      required this.workoutList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutTitle),
        backgroundColor: Color(int.parse(workoutColor)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (context, index) {
                return WorkoutListTile(
                    name: workoutList[index]['name'],
                    gifPath: workoutList[index]['gif'],
                    instructions: workoutList[index]['instructions'],
                    primaryMuscles: workoutList[index]['primaryMuscles'],
                    level: workoutList[index]['level']
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
