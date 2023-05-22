import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Merhaba, Burası Diet Sayfası.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
