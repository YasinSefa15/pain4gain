import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/home_page/HomePage.dart';

class PedometerComponent extends StatefulWidget {
  @override
  _PedometerComponentState createState() => _PedometerComponentState();
}

class _PedometerComponentState extends State<PedometerComponent> {
  int _stepCount = 0;
  bool _isListening = false;
  StreamSubscription<AccelerometerEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _loadStepCount();
    _startMotion().catchError((error, stackTrace) {
      print('Error starting motion: $error');
      print(stackTrace);
    });
  }

  @override
  void dispose() {
    _stopMotion();
    super.dispose();
  }

  void _loadStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedStepCount = prefs.getInt('stepCount') ?? 0;
    DateTime savedDate =
        DateTime.fromMillisecondsSinceEpoch(prefs.getInt('date') ??
            DateTime.now().millisecondsSinceEpoch);
    DateTime currentDate = DateTime.now();

    if (currentDate.year != savedDate.year ||
        currentDate.month != savedDate.month ||
        currentDate.day != savedDate.day) {
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

  Future<void> _startMotion() async {
    try {
      _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
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
    } catch (error, stackTrace) {
      print('Error starting motion: $error');
      print(stackTrace);
    }
  }

  void _stopMotion() {
    _subscription?.cancel();
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
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return ElevatedButton(
                  child: const Text('Open route'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                );
              }),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8),
                  Text('Step Counter'),
                ],
              ),
              SizedBox(width: 8),
              Text(
                'Steps: $_stepCount',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
