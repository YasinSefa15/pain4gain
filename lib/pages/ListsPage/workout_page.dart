import 'package:flutter/material.dart';

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
                print(workoutList[index]);
                return ListTile(
                  title: Text(workoutList[index]['name']),
                  subtitle: Text("asdsd"),
                  leading: Image.network(workoutList[index]['gif']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
