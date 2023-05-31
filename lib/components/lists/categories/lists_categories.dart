import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/categories/workout_type.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _categoryList = [];
    List<String> _categoryNameList = [
      'abs',
      'back',
      'biceps',
      'calves',
      'chest',
      'glutes',
      'legs',
      'shoulders',
      'traps',
      'triceps'
    ];

    _categoryList = List.generate(_categoryNameList.length, (index) {
      return WorkoutType(
        imagePath: 'assets/categories/${_categoryNameList[index]}.png',
      );
    });

    return SingleChildScrollView(
      //KATEGORİLERİN YAN YANA GELMESİ İÇİN
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categoryList,
      ),
    );
  }
}
