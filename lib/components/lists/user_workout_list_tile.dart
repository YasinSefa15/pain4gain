import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserWorkoutListTile extends StatelessWidget {
  final String name;
  final List<dynamic> instructions;
  final List<dynamic> primaryMuscles;
  final String imageGif;

  const UserWorkoutListTile({
    Key? key,
    required this.name,
    required this.instructions,
    required this.imageGif,
    required this.primaryMuscles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
        title: Text(name),
        subtitle: Text("Kaç set tekrar veya dakika?"),
        leading: Image.network(imageGif));
  }
}
