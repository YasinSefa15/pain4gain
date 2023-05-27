import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditingPage extends StatefulWidget {
  const ProfileEditingPage({Key? key}) : super(key: key);

  @override
  ProfileEditingPageState createState() => ProfileEditingPageState();
}


class ProfileEditingPageState extends State<ProfileEditingPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _workoutDaysController;
  String _gender = '';
  File? _profileImage;
  final ImagePicker _imagePicker = ImagePicker();

  Map<String, String> _errors = {
    'name': '',
    'age': '',
    'height': '',
    'weight': '',
    'workoutDays': '',
  };
  Future<void> _selectProfilePhoto() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery, // Option to choose from the gallery
      imageQuality: 80, // Adjust the image quality (0 - 100)
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _workoutDaysController = TextEditingController();
    _loadProfileData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _workoutDaysController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Reset error messages
    setState(() {
      _errors = {};
    });

    // Validate the input
    if (_nameController.text.isEmpty) {
      setState(() {
        _errors['username'] = 'Please enter your username';
      });
    }

    int? age = int.tryParse(_ageController.text);
    if (age == null || age <= 6 || age >= 101) {
      setState(() {
        _errors['age'] = 'Please enter a valid age';
      });
    }

    double? height = double.tryParse(_heightController.text);
    if (height == null || height <= 69 || height >= 251) {
      setState(() {
        _errors['height'] = 'Please enter a valid height';
      });
    }

    double? weight = double.tryParse(_weightController.text);
    if (weight == null || weight <= 29 || weight >= 301) {
      setState(() {
        _errors['weight'] = 'Please enter a valid weight';
      });
    }

    int? workoutDays = int.tryParse(_workoutDaysController.text);
    if (workoutDays == null || workoutDays < 1 || workoutDays > 7) {
      setState(() {
        _errors['workoutDays'] = 'Please enter a valid number of workout days (1-7)';
      });
    }

    if (_gender.isEmpty) {
      setState(() {
        _errors['gender'] = 'Please select a gender';
      });
    }

    if (_errors.isNotEmpty) {
      return;
    }

    // Save the profile data using shared_preferences
    _saveProfileData().then((_) {
      const snackBar = SnackBar(
        content: Text('Profile data changed successfully!'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _loadProfileData();

      // Remove the focus from the input fields
      FocusScope.of(context).unfocus();

      setState(() {
        // Clear the error messages
        _errors = {};
      });
    });
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('username') ?? '';
      _ageController.text = prefs.getInt('age')?.toString() ?? '';
      _heightController.text = prefs.getDouble('height')?.toString() ?? '';
      _weightController.text = prefs.getDouble('weight')?.toString() ?? '';
      _workoutDaysController.text = prefs.getInt('workoutDays')?.toString() ?? '';
      _gender = prefs.getString('gender') ?? '';
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    await prefs.setInt('age', int.parse(_ageController.text));
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
    await prefs.setString('gender', _gender);
    await prefs.setInt('workoutDays', int.parse(_workoutDaysController.text));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(210, 121, 247, 100),
              Color.fromRGBO(115, 85, 230, 100),
            ],
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _selectProfilePhoto, // Choose from gallery
                  child: ClipOval(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _profileImage != null
                            ? Image.file(
                          _profileImage!,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          'assets/default_user_avatar.png',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _showImageSourceDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 175),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: Colors.black54),
                            labelText: 'Enter your name',
                            labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                            //errorText: _errors['name'],
                            errorMaxLines: 1,
                            errorStyle: TextStyle()
                        ),
                      ),
                    ),
                    if (_errors.containsKey('username'))
                      Text(
                        _errors['username']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 175),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.black54),
                          labelText: 'Enter your age',
                          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    if (_errors.containsKey('age'))
                      Text(
                        _errors['age']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0),

                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 175),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.height,color: Colors.black54),
                          labelText: 'Enter your height (cm)',
                          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    if (_errors.containsKey('height'))
                      Text(
                        _errors['height']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 175),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.fitness_center, color: Colors.black54),
                          labelText: 'Enter your weight (kg)',
                          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    if (_errors.containsKey('weight'))
                      Text(
                        _errors['weight']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 175),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _workoutDaysController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.black54),
                          labelText: 'Enter number of workout days (1-7)',
                          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    if (_errors.containsKey('workoutDays'))
                      Text(
                        _errors['workoutDays']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Radio<String>(
                            activeColor: Colors.white60,
                            value: 'male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        const Text('Male', style: TextStyle(color: Colors.white60)),
                        const SizedBox(width: 15,),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Radio<String>(
                            activeColor: Colors.white,
                            value: 'female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        const Text('Female', style: TextStyle(color: Colors.white60)),
                      ],
                    ),
                    if (_errors.containsKey('gender'))
                      Text(
                        _errors['gender']!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: _saveProfile,
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Save',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: const Text('Take a Photo'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('Choose from Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      const profileImagePathKey = 'profile_image_path';

      // Save the file path to shared preferences
      await prefs.setString(profileImagePathKey, pickedFile.path);

      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
}

main() {
  runApp(const MaterialApp(
    home: ProfileEditingPage(),
  ));
}
