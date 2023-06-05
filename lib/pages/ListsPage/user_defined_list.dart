import 'package:flutter/material.dart';

class UserDefinedList extends StatelessWidget {
  final Map<String, dynamic> workout;
  final Color givenColor;

  const UserDefinedList({
    super.key,
    required this.workout, required this.givenColor,
  });

  @override
  Widget build(BuildContext context) {

    double desiredWidth = MediaQuery.of(context).size.width * 0.9;
    double desiredHeight = MediaQuery.of(context).size.height * 0.1;
    return Container(
      width: desiredWidth,
      height: desiredHeight,
      color: givenColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(workout["title"], style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}