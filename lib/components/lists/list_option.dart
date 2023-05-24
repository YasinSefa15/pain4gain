import 'package:flutter/material.dart';

class ListOption extends StatefulWidget {
  final Function(bool) onOptionChanged;

  ListOption({required this.onOptionChanged});

  @override
  _ListOptionState createState() => _ListOptionState();
}

class _ListOptionState extends State<ListOption> {
  bool isOption = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOption = true;
            });
            widget.onOptionChanged(isOption); // isOption değerini geri döndür
          },
          child: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
            child: Text("Pre-Defined Lists"),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isOption = false;
            });
            widget.onOptionChanged(isOption); // isOption değerini geri döndür
          },
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Text("My Lists"),
          ),
        ),
      ],
    );
  }
}
