import 'package:flutter/material.dart';
import 'package:pain4gain/pages/profile_page/profile_edit_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late File _profilePhoto = File('assets/default_user_avatar.png');
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfilePhoto();
  }

  void refresh() {
    setState(() {
      _loadProfilePhoto();
      getUsernameFromSharedPreferences();
      getAgeFromSharedPreferences();
      getWeightFromSharedPreferences();
      getHeightFromSharedPreferences();
      getGenderFromSharedPreferences();
      getWorkoutDaysFromSharedPreferences();
    });
  }

  Future<void> _loadProfilePhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profilePhotoPath = prefs.getString('profile_image_path');

    if (profilePhotoPath != null && profilePhotoPath.isNotEmpty) {
      setState(() {
        _profilePhoto = File(profilePhotoPath);
      });
    } else {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String defaultImagePath =
          '${appDirectory.path}/default_user_avatar.png';

      if (File(defaultImagePath).existsSync()) {
        setState(() {
          _profilePhoto = File(defaultImagePath);
        });
      } else {
        final ByteData imageData =
        await rootBundle.load('assets/default_user_avatar.png');
        final File defaultImageFile = File(defaultImagePath);
        await defaultImageFile.writeAsBytes(imageData.buffer.asUint8List());

        setState(() {
          _profilePhoto = defaultImageFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: const Text('Profile'),
      backgroundColor: const Color(0xFF1D1D1D),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileEditingPage(),
              ),
            );

            // Check if the result is not null, indicating changes were made
            if (result != null) {
              refresh();
            }
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: const Color(0xFF1D1D1D),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CircleAvatar(
                radius: mediaQuery.size.width * 0.25,
                backgroundImage: _profilePhoto.existsSync()
                    ? FileImage(_profilePhoto)
                    : AssetImage('assets/default_user_avatar.png') as ImageProvider<Object>,
              ),
              const SizedBox(height: 20),
              FutureBuilder<String>(
                future: getUsernameFromSharedPreferences(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return buildProfileInfoColor(
                      'Username',
                      snapshot.data!,
                      Colors.white, // Set the desired color for the username
                    );
                  } else if (snapshot.hasError) {
                    return buildErrorText('Error retrieving username');
                  } else {
                    return buildLoadingIndicator();
                  }
                },
              ),
              const SizedBox(height: 16),
              buildInfoRow(
                'Age',
                FutureBuilder<int>(
                  future: getAgeFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error retrieving age');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildInfoRow(
                'Gender',
                FutureBuilder<String>(
                  future: getGenderFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error retrieving gender');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildInfoRow(
                'Height',
                FutureBuilder<double>(
                  future: getHeightFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data.toString()} cm',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error retrieving height');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildInfoRow(
                'Weight',
                FutureBuilder<double>(
                  future: getWeightFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data.toString()} kg',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error retrieving weight');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildInfoRow(
                'Workout Days Per Week',
                FutureBuilder<int>(
                  future: getWorkoutDaysFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error retrieving workoutDays');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileInfo(String title, String value) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, Widget futureBuilder) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                futureBuilder,
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget buildErrorText(String errorText) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Text(
        errorText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: const CircularProgressIndicator(),
    );
  }

  Widget buildProfileInfoColor(String label, String value, Color textColor) {
    return Text(
      '$label: $value',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor, // Use the specified color for the text
      ),
    );
  }

  Future<String> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username ?? 'Default Username';
  }

  Future<int> getAgeFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? age = prefs.getInt('age');
    return age ?? 0;
  }

  Future<double> getHeightFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? height = prefs.getDouble('height');
    return height ?? 0;
  }

  Future<double> getWeightFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? weight = prefs.getDouble('weight');
    return weight ?? 0;
  }

  Future<String> getGenderFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? gender = prefs.getString('gender');
    return gender ?? 'Default Gender';
  }

  Future<int> getWorkoutDaysFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? workoutDays = prefs.getInt('workoutDays');
    return workoutDays ?? 0;
  }
}
