import 'package:flutter/material.dart';
import 'package:pain4gain/components/home/discover/DiscoverSingleWorkout.dart';

class DiscoverWorkoutsComponent extends StatelessWidget {
  const DiscoverWorkoutsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Discover New Workouts",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
    );
  }
}
