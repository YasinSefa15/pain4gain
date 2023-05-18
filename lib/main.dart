import 'package:flutter/material.dart';
import 'package:pain4gain/AppPage.dart';
import 'package:pain4gain/pages/home_page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pain4Gain',
      home: AppPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
