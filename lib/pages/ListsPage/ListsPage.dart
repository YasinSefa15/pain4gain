import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/pages/ListsPage/user_defined_list.dart';
import 'package:pain4gain/pages/ListsPage/user_defined_list/user_exercise_page/user_workout_page.dart';

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

    void onPressedCreateFunction() {
      String enteredText = '';
      // Düğmeye tıklandığında gerçekleştirilecek işlemler burada yer alır.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create List'),
            content: TextField(
              onChanged: (text) {
                setState(() {
                  enteredText = text;
                });
              },
              controller: null,
              decoration: InputDecoration(
                hintText: 'Enter the title of the list',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Kaydet'),
                onPressed: () {
                  // Girilen metni kullanmak için burada işlemler yapabilirsiniz
                  listJsonController.writeDefinedListJsonFile(enteredText);
                  print('Girilen metin: $enteredText');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('Düğmeye tıklandı!');
    }

    //reads the user defined list
    listJsonController.readDefinedListJsonFile(false).then((jsonMap) {
      _userDefinedWorkoutList.add(Row(children: [
        ElevatedButton(
          onPressed: onPressedCreateFunction,
          child: Text("Create List!!",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ]));
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
                    builder: (context) => UserWorkoutPage(
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

    return Container(
      color: Color(0xFF1D1D1D),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Bodypart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: screenHeight * 0.02),
            ListCategories(
              deviceWidth: screenWidth,
              deviceHeight: screenHeight,
              listJsonController: listJsonController,
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 116, 124, 175),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Workout List',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
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
      ),
    );
  }
}
