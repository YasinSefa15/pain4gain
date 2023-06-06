import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedometerComponent extends StatefulWidget {
  @override
  PedometerComponentState createState() => PedometerComponentState();
}

class PedometerComponentState extends State<PedometerComponent> {
  int stepCount = 0;
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    loadStepCount();
    startListening();
  }

  void loadStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedStepCount = prefs.getInt('stepCount') ?? 0;
    DateTime savedDate = DateTime.fromMillisecondsSinceEpoch(prefs.getInt('date') ?? DateTime.now().millisecondsSinceEpoch);
    DateTime currentDate = DateTime.now();
    
    if (currentDate.year != savedDate.year || currentDate.month != savedDate.month || currentDate.day != savedDate.day) {
      setState(() {
        stepCount = 0;
      });
      prefs.setInt('stepCount', 0);
      prefs.setInt('date', currentDate.millisecondsSinceEpoch);
    } else {
      setState(() {
        stepCount = savedStepCount;
      });
    }
  }

  void startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x > 10.0 || event.y > 10.0 || event.z > 10.0) {
        setState(() {
          stepCount++;
        });
        _saveStepCount();
      }
    });
    setState(() {
      isListening = true;
    });
  }

  void stopListening() {
    setState(() {
      isListening = false;
    });
  }

  void _saveStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('stepCount', stepCount);
    prefs.setInt('date', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Steps: $stepCount',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              isListening ? 'Walking' : 'Stop',
              style: TextStyle(fontSize: 18),
            ),
            FloatingActionButton(
              onPressed: isListening ? stopListening : startListening,
              child: Icon(isListening ? Icons.stop : Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
