import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/components/lists/workout_type.dart';

import '../../json/JsonFileManager.dart';
import '../../json/ListJsonController.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = true;

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

    List<Widget> _workoutList = List.generate(10, (index) {
      if (isOption) {
        WorkoutList(
          color: Colors.primaries[index],
          desiredWidth: screenWidth * 0.95,
          desiredHeight: screenHeight * 0.25,
          title: 'option $isOption',
          imagePath: 'assets/fitness_man.png',
        );
      }
      return WorkoutList(
        color: Colors.primaries[index],
        desiredWidth: screenWidth * 0.95,
        desiredHeight: screenHeight * 0.25,
        title: 'option $isOption',
        imagePath: 'assets/fitness_man.png',
      );
    });

    List<Widget> _categoryList = List.generate(2, (index) {
      listJsonController.readCategoryJsonFile().then((value) {
        print(value);
        if (value != null) {
          return WorkoutType(
            icon: IconData(value['category_types'][index]['icon'], fontFamily: 'MaterialIcons'),
          );
        }
      });
      return const WorkoutType(
        //choose random icon
        icon: Icons.alarm_add_sharp,
      );
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          ListOption(
            onOptionChanged: (value) {
              changeOption(value);
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(isOption.toString()),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ListCategories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            //KATEGORİLERİN YAN YANA GELMESİ İÇİN
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categoryList,
            ),
          ),
          Column(
            children: _workoutList,
          )
        ],
      ),
    );
  }
}
