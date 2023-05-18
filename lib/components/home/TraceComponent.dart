import 'package:flutter/material.dart';

class TraceComponent extends StatelessWidget {
  const TraceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          //3 ününde olduğu yer
          children: [
            Column(
              children: [
                CustomTrace(
                  backgroundColor: Colors.deepOrange,
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.55,
                  title: "Finished",
                  number: 2,
                  subText: "",
                  icon: Icons.mark_unread_chat_alt,
                ),
              ],
            ), //soldaki dik
            SizedBox(width: screenWidth * 0.05),
            Column(
              children: [
                Column(
                  //sağdaki yatay altlı üstlü iki yer
                  children: [
                    Row(
                      children: [
                        CustomTrace(
                          backgroundColor: Colors.lightBlueAccent,
                          width: screenWidth * 0.45,
                          height: screenWidth * 0.25,
                          title: "In Progress",
                          number: 2,
                          subText: "Workouts",
                          icon: Icons.mark_unread_chat_alt,
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    Row(
                      children: [
                        CustomTrace(
                          backgroundColor: Colors.deepPurpleAccent,
                          width: screenWidth * 0.45,
                          height: screenWidth * 0.25,
                          title: "Time Spend",
                          number: 2,
                          subText: "Minutes",
                          icon: Icons.mark_unread_chat_alt,
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class CustomTrace extends StatefulWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double number;
  final String title;
  final String subText;
  final IconData icon;

  const CustomTrace(
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
  _CustomTrace createState() => _CustomTrace();
}

class _CustomTrace extends State<CustomTrace> {
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
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold
                ),
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
