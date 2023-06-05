import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedometerComponent extends StatefulWidget {
  @override
  _PedometerComponentState createState() => _PedometerComponentState();
}

class _PedometerComponentState extends State<PedometerComponent> {
  int _stepCount = 0;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _loadStepCount();
    _startListening();
  }

  void _loadStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedStepCount = prefs.getInt('stepCount') ?? 0;
    DateTime savedDate = DateTime.fromMillisecondsSinceEpoch(prefs.getInt('date') ?? DateTime.now().millisecondsSinceEpoch);
    DateTime currentDate = DateTime.now();
    
    if (currentDate.year != savedDate.year || currentDate.month != savedDate.month || currentDate.day != savedDate.day) {
      setState(() {
        _stepCount = 0;
      });
      prefs.setInt('stepCount', 0);
      prefs.setInt('date', currentDate.millisecondsSinceEpoch);
    } else {
      setState(() {
        _stepCount = savedStepCount;
      });
    }
  }

  void _startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x > 10.0 || event.y > 10.0 || event.z > 10.0) {
        setState(() {
          _stepCount++;
        });
        _saveStepCount();
      }
    });
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });
  }

  void _saveStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('stepCount', _stepCount);
    prefs.setInt('date', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Steps: $_stepCount',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              _isListening ? 'Walking' : 'Stop',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isListening ? _stopListening : _startListening,
        child: Icon(_isListening ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}

