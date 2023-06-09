import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TraceComponent extends StatefulWidget {
  final BoxConstraints constraints;
  const TraceComponent({Key? key, required this.constraints}) : super(key: key);

  @override
  State<TraceComponent> createState() => _TraceComponentState();
}

class _TraceComponentState extends State<TraceComponent> {

  void initState() {
    super.initState();
    refresh();
  }
  void refresh() {
    setState(() {
      getCompletedWorkoutsFromSharedPreferences();
      getWorkoutTimeFromSharedPreferences();
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(15),
      constraints: BoxConstraints(
        minWidth: widget.constraints.minWidth,
        maxWidth: widget.constraints.maxWidth,
        minHeight: widget.constraints.minHeight,
        maxHeight: widget.constraints.maxHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: screenHeight / 3,
              width: screenWidth / 2 - 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/fitness_girl.png"),
                    alignment: Alignment.bottomCenter,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(115, 85, 230, 100),
                      Color.fromRGBO(210, 121, 247, 100)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: const [0.2, 0.9],
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.1)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.fitness_center,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Finished",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FutureBuilder<int>(
                              future: getCompletedWorkoutsFromSharedPreferences(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Error retrieving completed workout');
                                } else {
                                  int? completedWorkouts = snapshot.data;
                                  return Text(
                                    '${completedWorkouts?.toString()}',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              },
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Complete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Workout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 3,
                  width: screenWidth / 2 - 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/fitness_man.png"),
                        alignment: Alignment.bottomCenter,
                      ),
                      gradient: LinearGradient(
                        end: Alignment.bottomLeft,
                        begin: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(85, 131, 238, 100),
                          Color.fromRGBO(65, 216, 221, 100)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: [0.2, 0.7],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.1),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.fitness_center,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "Time Spend",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FutureBuilder<int>(
                                  future: getWorkoutTimeFromSharedPreferences(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return const Text('Error retrieving workout time');
                                    } else {
                                      int? completedWorkouts = snapshot.data;
                                      return Text(
                                        '${completedWorkouts?.toString()}',
                                        style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      "Minutes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<int> getCompletedWorkoutsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int completedWorkouts = prefs.getInt('completedWorkouts') ?? 0;
    return completedWorkouts;
  }
  Future<int> getWorkoutTimeFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int workoutTime = prefs.getInt('workoutTime') ?? 0;
    return workoutTime;
  }
}
