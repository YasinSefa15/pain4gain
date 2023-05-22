import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Merhaba, Burası Profil Sayfası.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
