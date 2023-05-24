import 'package:flutter/material.dart';
import 'package:pain4gain/components/home/discover/DiscoverSingleWorkout.dart';

class DiscoverWorkoutsComponent extends StatelessWidget {
  const DiscoverWorkoutsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Discover New Workouts!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left),

          //SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return const DiscoverSingleWorkout(
                        title: "Cardio",
                        exerciseCount: "50",
                        time: "12",
                        imagePath: "",
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
