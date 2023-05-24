import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/components/lists/workout_type.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = true;

  void changeOption(bool value) {
    setState(() {
      isOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
            //
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
              children: List.generate(80, (index) {
                return const WorkoutType();
              }),
            ),
          ),
          Column(
            children: List.generate(10, (index) {
              return WorkoutList(
                color: Colors.primaries[index],
                desiredWidth: screenWidth * 0.95,
                title: 'option $isOption',
                imagePath: 'assets/fitness_man.png',
              );
            }),
          )
        ],
      ),
    );
  }
}
