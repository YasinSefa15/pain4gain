import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';
import 'package:pain4gain/components/lists/workout_list.dart';
import 'package:pain4gain/components/lists/workout_type.dart';
import 'package:pain4gain/pages/ListsPage/workout_page.dart';

import '../../json/ListJsonController.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = true;
  List<Widget> _categoryList = [];
  List<Widget> _workoutList = [];

  ListJsonController listJsonController = ListJsonController();

  void changeOption(bool value) {
    setState(() {

      isOption = value;
    });
  }
  void loadCategories(){
    listJsonController.readCategoryJsonFile().then((value) {
      if (value != null && _categoryList.isEmpty) {
        setState(() {
          _categoryList = List.generate(value['categories'].length, (index) {
            return WorkoutType(
              imagePath: value['categories'][index.toString()]['imagePath'],
            );
          });
        });
      }
    }).catchError((onError) {
      print(onError);
    });
  }


  @override
  void initState() {
    super.initState();
    // Kategori listesini ilk kez yüklemek için burada çağırılır
    loadCategories();
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
            deviceWidth : screenWidth,
            deviceHeight : screenHeight,
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

