import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
   return Scaffold(
  backgroundColor: const Color(0xFFE9E9E9),
  
 
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: height*0.38,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey,
                height: height*0.5,
              ),
            ),
          ],
        ));
  }
}
