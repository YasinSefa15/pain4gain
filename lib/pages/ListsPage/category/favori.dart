import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteWorkouts = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
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

  void _removeFavorite(Map<String, dynamic> workout) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteWorkouts.remove(workout);
      List<String> favorites = favoriteWorkouts.map((w) => json.encode(w)).toList();
      prefs.setStringList('favorites', favorites);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteWorkouts.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> workout = favoriteWorkouts[index];
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
                            SizedBox(width: 90),
                            IconButton(
                              onPressed: () {
                                _removeFavorite(workout);
                              },
                              icon: Icon(
                                Icons.favorite,
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