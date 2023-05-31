import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pain4gain/pages/ListsPage/category/category_exervise_page.dart';

class WorkoutType extends StatelessWidget {
  final String imagePath;

  const WorkoutType({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Yeni sayfa açılışını Navigator ile yönetebilirsiniz
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryExercisePage()
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
