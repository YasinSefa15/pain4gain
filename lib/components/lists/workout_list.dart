import 'package:flutter/material.dart';
import '../../pages/ListsPage/workout_page.dart';

class WorkoutList extends StatelessWidget {
  final Color color;
  // final double desiredWidth;
  final String title;
  final String imagePath;
  //final double desiredHeight;
  final List<dynamic> workoutList;

  const WorkoutList(
      {Key? key,
        required this.color,
        //required this.desiredWidth,
        required this.title,
        required this.imagePath,
        //required this.desiredHeight,
        required this.workoutList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double desiredWidth = MediaQuery.of(context).size.width * 0.9;
    double desiredHeight = MediaQuery.of(context).size.height * 0.2;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        width: desiredWidth,
        height: desiredHeight,
        margin: const EdgeInsets.all(10),
        //generate random color
        //color: color,
        child: Row(
          children: [
            Container(
              width: desiredWidth * 0.45,
              height: desiredHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(width: desiredWidth * 0.05),
                      SizedBox(
                        width: desiredWidth * 0.4,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: desiredWidth * 0.15),
                      ElevatedButton(
                        onPressed: () {
                          // Düğme tıklandığında gerçekleşecek işlemler
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutPage(
                                filePath: imagePath,
                                workoutTitle: title,
                                workoutColor: color,
                                workoutList: workoutList,
                              ), // İkinci sayfa
                            ),
                          );
                        },
                        child: Text('View'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: desiredWidth * 0.4,
                  height: desiredHeight * 0.9,
                  fit: BoxFit.contain,
                ),
              ],
            )
          ],
        ));
  }
}
