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
            color: Colors.blue,
            width: widget.deviceWidth * 0.25,
            height: widget.deviceHeight * 0.06,
            child: const Center(
                child: Text(
              "Pre-Defined Lists",
              textAlign: TextAlign.center,
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
            color: Colors.green,
            width: widget.deviceWidth * 0.25,
            height: widget.deviceHeight * 0.06,
            child: const Center(
                child: Text(
              "My Lists",
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ],
    );
  }
}
