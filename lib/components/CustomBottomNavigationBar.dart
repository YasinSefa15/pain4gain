import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Lists',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Diet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      backgroundColor: const Color(0xFF008080),
      selectedItemColor: const Color(0xFFFFA500),
      unselectedItemColor: const Color(0xFFE0E0E0),
      type: BottomNavigationBarType.fixed,
    );
  }
}