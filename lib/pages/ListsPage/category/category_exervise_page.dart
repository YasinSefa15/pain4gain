import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryExercisePage extends StatefulWidget {
  final String exerciseTitle;
  final List workouts;
  const CategoryExercisePage(
      {Key? key, required this.exerciseTitle, required this.workouts})
      : super(key: key);

  @override
  _CategoryExercisePageState createState() => _CategoryExercisePageState();
}

class _CategoryExercisePageState extends State<CategoryExercisePage> {
  List<Map<String, dynamic>> favoriteWorkouts = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _addFavorite(Map<String, dynamic> workout) {
    setState(() {
      favoriteWorkouts.add(workout);
      _saveFavorites();
    });
  }

  void _removeFavorite(Map<String, dynamic> workout) {
    setState(() {
      favoriteWorkouts.remove(workout);
      _saveFavorites();
    });
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      favoriteWorkouts = favorites
          .map<Map<String, dynamic>>((w) => Map<String, dynamic>.from(json.decode(w)))
          .toList();
    });
  }

  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = favoriteWorkouts.map((w) => json.encode(w)).toList();
    prefs.setStringList('favorites', favorites);
  }

  bool _isFavorite(Map<String, dynamic> workout) {
    return favoriteWorkouts.any((w) => w['name'] == workout['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.workouts.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> workout = widget.workouts[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workout['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                workout['level'],
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                workout['mechanic'],
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                workout['equipment'],
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 80),
                            IconButton(
                              onPressed: () {
                                if (_isFavorite(workout)) {
                                  _removeFavorite(workout);
                                } else {
                                  _addFavorite(workout);
                                }
                              },
                              icon: Icon(
                                _isFavorite(workout)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                        Image.network(workout['gif']),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: workout['instructions']
                          .map<Widget>((instruction) {
                        return ListTile(
                          leading: Icon(Icons.arrow_right_rounded),
                          title: Text(instruction),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


