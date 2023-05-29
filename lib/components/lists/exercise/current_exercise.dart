import 'package:flutter/material.dart';

class CurrentExercise extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseImagePath;
  final List<dynamic> exerciseList;

  const CurrentExercise({
    super.key,
    required this.exerciseTitle,
    required this.exerciseImagePath, required this.exerciseList,
  });

  @override
  State<CurrentExercise> createState() => _CurrentExerciseState();
}

class _CurrentExerciseState extends State<CurrentExercise> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Image.network(
            widget.exerciseImagePath,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
          ),
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
