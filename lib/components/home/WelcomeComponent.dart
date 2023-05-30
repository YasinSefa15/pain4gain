import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

class WelcomeComponent extends StatefulWidget {
  final BoxConstraints constraints;
  const WelcomeComponent({Key? key, required this.constraints}) : super(key: key);
  @override
  State<WelcomeComponent> createState() => _WelcomeComponentState();
}

class _WelcomeComponentState extends State<WelcomeComponent> {
  late File _profilePhoto = File('assets/default_user_avatar.png');
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfilePhoto();
  }

  void refresh() {
    setState(() {
      _isLoading = true; // Start loading animation again
      _loadProfilePhoto();
      getUsernameFromSharedPreferences();
    });
  }

  @override
 Widget build(BuildContext context) {
  return Container(
    constraints: BoxConstraints(
      minWidth: widget.constraints.minWidth,
      maxWidth: widget.constraints.maxWidth,
      minHeight: widget.constraints.minHeight,
      maxHeight: widget.constraints.maxHeight,
    ),
    decoration: BoxDecoration(),
    padding: EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, 
        children: [
          Flexible(
            fit: FlexFit.loose, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: getUsernameFromSharedPreferences(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return buildProfileInfoColor(
                        snapshot.data!,
                        Colors.white,
                      );
                    } else if (snapshot.hasError) {
                      return buildErrorText('username');
                    } else {
                      return buildLoadingIndicator();
                    }
                  },
                ),
                Text(
                  "Let's check your activity today!",
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(width: 55.0),
          _isLoading
              ? const CircularProgressIndicator()
              : CircleAvatar(
                  backgroundImage: _profilePhoto.existsSync()
                      ? FileImage(_profilePhoto)
                      : AssetImage('assets/default_user_avatar.png') as ImageProvider<Object>,
                ),
        ],
      ),
    ),
  );
}




  Future<String> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username ?? 'Default Username';
  }

  Widget buildProfileInfoColor(String value, Color textColor) {
    return Text(
      value.toUpperCase(),
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: textColor, 
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

  Future<void> _loadProfilePhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profilePhotoPath = prefs.getString('profile_image_path');

    if (profilePhotoPath != null && profilePhotoPath.isNotEmpty) {
      setState(() {
        _profilePhoto = File(profilePhotoPath);
        _isLoading = false; // Stop loading animation
      });
    } else {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String defaultImagePath =
          '${appDirectory.path}/default_user_avatar.png';

      if (File(defaultImagePath).existsSync()) {
        setState(() {
          _profilePhoto = File(defaultImagePath);
          _isLoading = false; // Stop loading animation
        });
      } else {
        final ByteData imageData =
        await rootBundle.load('assets/default_user_avatar.png');
        final File defaultImageFile = File(defaultImagePath);
        await defaultImageFile.writeAsBytes(imageData.buffer.asUint8List());

        setState(() {
          _profilePhoto = defaultImageFile;
          _isLoading = false; // Stop loading animation
        });
      }
    }
  }
}
