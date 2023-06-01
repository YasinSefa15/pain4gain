import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/categories/workout_type.dart';
import 'package:pain4gain/json/ListJsonController.dart';

class ListCategories extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;
  final ListJsonController listJsonController;
  ListCategories({super.key, required this.deviceWidth, required this.deviceHeight, required this.listJsonController});

  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories>{
  List<Widget> _categoryList = [];



  void initCategory(){
    widget.listJsonController.readCategoryJsonFile().then((value) {
      //print(value);
      if(value != null){
        _categoryList = List.generate(value.length, (index) {
          return WorkoutType(
              imagePath: '${value[index.toString()]['imagePath']}',
              exerciseTitle : value[index.toString()]['title'],
              workouts : value[index.toString()]['workouts']
          );
        });
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    setState(() {
      initCategory();
    });
    //initCategory();

    return SingleChildScrollView(
      //KATEGORİLERİN YAN YANA GELMESİ İÇİN
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categoryList,
      ),
    );
  }
}
