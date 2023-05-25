import 'package:flutter/material.dart';

import 'meal.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFE9E9E9),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: height * 0.38,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 8,
                        left: 32,
                        right: 16,
                      ),
                      child: Text(
                        "MEALS FOR TODAY",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 32,
                            ),
                            for (int i = 0; i < meals.length; i++)
                              _MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  meal.imagePath,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
