import 'package:flutter/material.dart';
import 'package:pain4gain/components/CustomBottomNavigationBar.dart';
import 'package:pain4gain/pages/home_page/ListsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Merhaba Ana Sayfa Burada Yer Alacak',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
