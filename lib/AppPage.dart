import 'package:flutter/material.dart';
import 'package:pain4gain/components/CustomBottomNavigationBar.dart';
import 'package:pain4gain/pages/diet_page/DietPage.dart';
import 'package:pain4gain/pages/home_page/HomePage.dart';
import 'package:pain4gain/pages/ListsPage/ListsPage.dart';
import 'package:pain4gain/pages/profile_page/ProfilePage.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    ListsPage(),
    DietPage(),
    const ProfilePage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pain4Gain'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D1D1D),
        leading: null,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
