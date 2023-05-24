import 'package:flutter/material.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Hi, Eren Welcome!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 27),
              ),
              Text(
                "Let's check your activity today!",
                style: TextStyle(color: Colors.white60, fontSize: 15),
              )
            ],
          ),
          SizedBox(width: 55.0),
          ClipOval(
            child: Image(
              image: AssetImage('assets/default_user_avatar.png'),
              width: 70.0,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
