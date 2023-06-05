


import 'package:flutter/material.dart';

class CreateListPage extends StatefulWidget {
  @override
  _CreateListPageState createState() => _CreateListPageState();
}

class _CreateListPageState extends State<CreateListPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create List"),
      ),
      body: Center(
        child: Text("Create List Page"),
      ),
    );
  }
}