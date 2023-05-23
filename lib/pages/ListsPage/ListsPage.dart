import 'package:flutter/material.dart';
import 'package:pain4gain/components/lists/list_option.dart';

import '../../components/lists/list_categories.dart';

class ListsPage extends StatefulWidget {
  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  bool isOption = false;

  void changeOption(bool value) {
    setState(() {
      isOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Align(
          alignment: Alignment.centerLeft,
          child: ListCategories(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(80, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 5),
                width: 30,
                height: 30,
                color: Colors.blue,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 20,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
