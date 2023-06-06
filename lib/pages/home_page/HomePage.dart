import 'package:flutter/material.dart';
import 'package:pain4gain/components/home/WelcomeComponent.dart';
import 'package:pain4gain/components/pedometer/PedometerComponent.dart';
import '../../components/home/discover/DiscoverWorkoutsComponent.dart';
import '../../components/home/trace/TraceComponent.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return WelcomeComponent(constraints: constraints);
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return TraceComponent(constraints: constraints);
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return DiscoverWorkoutsComponent(constraints: constraints);
                },
              ),
              /*LayoutBuilder(builder: (context, constraints) {
                return ElevatedButton(
                  child: const Text('Open route'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PedometerComponent(),
                      ),
                    );
                  },
                );
              })*/
            ],
          ),
        ),
      ),
      
    );
  }
}
