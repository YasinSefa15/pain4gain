import 'package:flutter/material.dart';

class ListOption extends StatefulWidget {
  final Function(bool) onOptionChanged;
  final double deviceWidth;
  final double deviceHeight;

  const ListOption(
      {required this.onOptionChanged,
        required this.deviceWidth,
        required this.deviceHeight});

  @override
  _ListOptionState createState() => _ListOptionState();
}

class _ListOptionState extends State<ListOption> {
  bool isOption = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOption = true;
            });
            widget.onOptionChanged(isOption); // isOption değerini geri döndür
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(85, 131, 238, 1),
                  Color.fromRGBO(65, 216, 221, 1)
                ],
              ),
            ),
            //color: Colors.blue,
            width: widget.deviceWidth * 0.25,
            height: widget.deviceHeight * 0.06,
            child: const Center(
                child: Text(
                  "Pre-Defined Lists",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ),
        SizedBox(width: widget.deviceWidth * 0.05),
        GestureDetector(
          onTap: () {
            setState(() {
              isOption = false;
            });
            widget.onOptionChanged(isOption); // isOption değerini geri döndür
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(196, 231, 89, 1),
                  Color.fromRGBO(109, 225, 149, 1)
                ],
              ),
            ),
            //color: Colors.green,
            width: widget.deviceWidth * 0.25,
            height: widget.deviceHeight * 0.06,
            child: const Center(
                child: Text(
                  "My Lists",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ],
    );
  }
}
