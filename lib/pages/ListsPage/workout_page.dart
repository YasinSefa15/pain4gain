import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/workout_list_tile.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutTitle;
  final Color workoutColor;
  final List<dynamic> workoutList;
  final String filePath;

  const WorkoutPage(
      {super.key,
      required this.workoutTitle,
      required this.workoutColor,
      required this.workoutList,
      required this.filePath});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(workoutTitle),
        backgroundColor: workoutColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            filePath,
            fit: BoxFit.contain,
            width: screenWidth,
            height: screenWidth * 0.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (context, index) {
                return WorkoutListTile(
                    name: workoutList[index]['name'],
                    gifPath: workoutList[index]['gif'],
                    instructions: workoutList[index]['instructions'],
                    primaryMuscles: workoutList[index]['primaryMuscles'],
                    level: workoutList[index]['level']);
              },
            ),
          ),
        ],
      ),
    );
  }
}
