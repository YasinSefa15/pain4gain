import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutTitle;
  final String workoutColor;
  final List<dynamic> workoutList;

  const WorkoutPage({
    Key? key,
    required this.workoutTitle,
    required this.workoutColor,
    required this.workoutList,
  }) : super(key: key);

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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workoutList[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        Image.network(workoutList[index]['gif']),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Instructions:', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: workoutList[index]['instructions']
                          .map<Widget>((instruction) {
                        return Text(instruction);
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

