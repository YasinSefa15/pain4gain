import 'package:flutter/material.dart';

class UserCurrentExercise extends StatefulWidget {
  final String exerciseTitle;
  final List<dynamic> exerciseList;

  const UserCurrentExercise({
    super.key,
    required this.exerciseTitle,
    required this.exerciseList,
  });

  @override
  State<UserCurrentExercise> createState() => _UserCurrentExerciseState();
}

class _UserCurrentExerciseState extends State<UserCurrentExercise> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Text(
            widget.exerciseTitle,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.exerciseList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.arrow_right),
                  title: Text(widget.exerciseList[index]),
                );
              }),
        ],
      ),
    );
  }
}
