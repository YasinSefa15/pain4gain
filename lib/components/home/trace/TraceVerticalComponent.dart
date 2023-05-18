import 'package:flutter/material.dart';

class CustomVerticalTrace extends StatefulWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double number;
  final String title;
  final String subText;
  final IconData icon;

  const CustomVerticalTrace(
      {Key? key,
      required this.backgroundColor,
      required this.width,
      required this.height,
      required this.title,
      required this.number,
      required this.subText,
      required this.icon})
      : super(key: key);

  @override
  _CustomVerticalTrace createState() => _CustomVerticalTrace();
}

class _CustomVerticalTrace extends State<CustomVerticalTrace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              Icon(widget.icon),
              Text(widget.title),
            ],
          ),
          Row(
            children: [
              Text(
                widget.number.toString(),
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(widget.subText)
            ],
          )
        ],
      ),
    );
  }
}
