import 'package:flutter/material.dart';
import 'package:pain4gain/components/home/WelcomeComponent.dart';

import '../../components/home/discover/DiscoverWorkoutsComponent.dart';
import '../../components/home/trace/TraceComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          WelcomeComponent(),
          TraceComponent(),
          DiscoverWorkoutsComponent(),
        ],
      ),
    );
  }
}
