import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutListTile extends StatelessWidget {
  final String name;
  final String gifPath;
  final List<dynamic> instructions;
  final List<dynamic> primaryMuscles;
  final String level;

  const WorkoutListTile(
      {Key? key,
      required this.name,
      required this.gifPath,
      required this.instructions,
      required this.primaryMuscles,
      required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(name),
      subtitle: Text("Kaç set tekrar veya dakika?"),
      leading: Image.network(
        gifPath,
        width: screenWidth * 0.1,
        height: screenWidth * 0.1,
        fit: BoxFit.cover,
      ),
    );
  }
}
