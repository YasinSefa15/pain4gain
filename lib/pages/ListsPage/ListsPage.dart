import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/pages/ListsPage/workout_page.dart';

import '../../json/ListJsonController.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = true;
  List<Widget> _workoutList = [];

  ListJsonController listJsonController = ListJsonController();

  void changeOption(bool value) {
    setState(() {

      isOption = value;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    if(isOption == true){
      listJsonController.readDefinedListJsonFile().then((value) {
        if (value != null && _workoutList.isEmpty) {
          setState(() {
            _workoutList = List.generate(value.length, (index) {
              //print(value);
              print(value[index.toString()]['workouts'].runtimeType);
              return   GestureDetector(
                onTap: () {
                  // Yeni sayfa açılışını Navigator ile yönetebilirsiniz
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPage(
                        //workoutList: value[index.toString()]['workouts'],
                        workoutTitle: value[index.toString()]['title'],
                        workoutColor: value[index.toString()]['color'],
                        workoutList: value[index.toString()]['workouts'],
                      ), // İkinci sayfa
                    ),
                  );
                },
                child: WorkoutList(
                  color: Color(int.parse(value[index.toString()]['color'])),
                  desiredWidth: screenWidth * 0.95,
                  desiredHeight: screenHeight * 0.25,
                  title: value[index.toString()]['title'],
                  imagePath: value[index.toString()]['imagePath'],
                ),
              );
            });
          });
        }
      }).catchError((onError) {
        //print(onError);
      });
    }else{
      _workoutList = [];
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [        
          SizedBox(height: screenHeight * 0.02),
          SizedBox(height: screenHeight * 0.02),
          Column(
            children: _workoutList,
          )
        ],
      ),
    );
  }
}

