import 'package:flutter/material.dart';
import 'package:pain4gain/components/home/trace/TraceHorizantalComponent.dart';
import 'package:pain4gain/components/home/trace/TraceVerticalComponent.dart';

class TraceComponent extends StatelessWidget {
  const TraceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          //3 ününde olduğu yer
          children: [
            Column(
              children: [
                CustomVerticalTrace(
                  backgroundColor: Colors.deepOrange,
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.55,
                  title: "Finished",
                  number: 2,
                  subText: "Completed \nWorkouts",
                  icon: Icons.mark_unread_chat_alt,
                ),
              ],
            ), //soldaki dik
            SizedBox(width: screenWidth * 0.05),
            Column(
              children: [
                Column(
                  //sağdaki yatay altlı üstlü iki yer
                  children: [
                    Row(
                      children: [
                        CustomHorizantalTrace(
                          backgroundColor: Colors.lightBlueAccent,
                          width: screenWidth * 0.45,
                          height: screenWidth * 0.25,
                          title: "In Progress",
                          number: 2,
                          subText: "Workouts",
                          icon: Icons.mark_unread_chat_alt,
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    Row(
                      children: [
                        CustomHorizantalTrace(
                          backgroundColor: Colors.deepPurpleAccent,
                          width: screenWidth * 0.45,
                          height: screenWidth * 0.25,
                          title: "Time Spend",
                          number: 2,
                          subText: "Minutes",
                          icon: Icons.mark_unread_chat_alt,
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
