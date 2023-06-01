import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/pages/ListsPage/user_defined_list/user_defined_list.dart';
import 'package:pain4gain/pages/ListsPage/user_defined_list/user_exercise_page/user_exercise_page.dart';

import '../../components/lists/categories/lists_categories.dart';
import '../../json/ListJsonController.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = true;
  List<Widget> _workoutList = [];
  List<Widget> _predefinedWorkoutList = [];
  List<Widget> _userDefinedWorkoutList = [];
  double screenWidth = 0;
  double screenHeight = 0;
  ListJsonController listJsonController = ListJsonController();
  Random random = Random();

  void changeOption(bool value) {
    setState(() {
      isOption = value;
      if (isOption == true) {
        _workoutList = _predefinedWorkoutList;
      } else {
        _workoutList = _userDefinedWorkoutList;
      }
    });
  }

  void readLists() {
    //first read the defined list and renders it
    listJsonController.readDefinedListJsonFile(true).then((value) {
      if (value != null && _predefinedWorkoutList.isEmpty) {
        setState(() {
          _workoutList = List.generate(value.length, (index) {
            //print(value);
            //print(value[index.toString()]['workouts'].runtimeType);
            return WorkoutList(
              color: Color(int.parse(value[index.toString()]['color'])),
              title: value[index.toString()]['title'],
              imagePath: value[index.toString()]['imagePath'],
              workoutList: value[index.toString()]['workouts'],
            );
          });
        });
        _predefinedWorkoutList = _workoutList;
      }
    }).catchError((onError) {
      //print(onError);
    });
    //reads the user defined list
    listJsonController.readDefinedListJsonFile(false).then((jsonMap) {
      if (jsonMap != null) {
        setState(() {
          for (var key in jsonMap.keys) {
            Color newColor = Color.fromARGB(255, random.nextInt(256),
                random.nextInt(256), random.nextInt(256));
            _userDefinedWorkoutList.add(GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserExercisePage(
                        exercise: jsonMap[key], givenColor: newColor),
                  ),
                );
              },
              child: UserDefinedList(
                workout: jsonMap[key],
                givenColor: newColor,
              ),
            ));
          }
        });
      }
    }).catchError((onError) {
      //print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    // Kategori listesini ilk kez yüklemek için burada çağırılır
    readLists();
    //_workoutList = _predefinedWorkoutList;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ListCategories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListCategories(
            deviceWidth: screenWidth,
            deviceHeight: screenHeight,
            listJsonController: listJsonController,
          ),
          SizedBox(height: screenHeight * 0.02),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Workout Lists',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ListOption(
            onOptionChanged: (value) {
              changeOption(value);
            },
            deviceWidth: screenWidth,
            deviceHeight: screenHeight,
          ),
          SizedBox(height: screenHeight * 0.02),
          Column(
            children: _workoutList,
          )
        ],
      ),
    );
  }
}
