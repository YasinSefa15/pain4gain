import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pain4gain/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _exerciseDaysController = TextEditingController();
  String? _selectedGender;
  bool _showUsernameError = false;
  bool _showGenderError = false;
  bool _showAgeError = false;
  bool _showHeightError = false;
  bool _showWeightError = false;
  bool _showExerciseDaysError = false;
  File? _profileImage;
  final ImagePicker _imagePicker = ImagePicker();

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
  void dispose() {
    _usernameController.dispose();
    _pageController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _exerciseDaysController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  bool _validateForm() {
    setState(() {
      _showUsernameError = _usernameController.text.isEmpty ||
          (_usernameController.text.length) < 5 ||
          (_usernameController.text.length) > 16;
      _showGenderError = _selectedGender == null;
      _showAgeError = _ageController.text.isEmpty ||
          int.tryParse(_ageController.text) == null ||
          int.parse(_ageController.text) < 7 ||
          int.parse(_ageController.text) > 100;
      _showHeightError = _heightController.text.isEmpty ||
          double.tryParse(_heightController.text) == null ||
          double.parse(_heightController.text) < 70 ||
          double.parse(_heightController.text) > 250;
      _showWeightError = _weightController.text.isEmpty ||
          double.tryParse(_weightController.text) == null ||
          double.parse(_weightController.text) < 30 ||
          double.parse(_weightController.text) > 300;
      _showExerciseDaysError = _exerciseDaysController.text.isEmpty ||
          int.tryParse(_exerciseDaysController.text) == null ||
          int.parse(_exerciseDaysController.text) < 0 ||
          int.parse(_exerciseDaysController.text) > 7;
    });

    return !_showUsernameError &&
        !_showGenderError &&
        !_showAgeError &&
        !_showHeightError &&
        !_showWeightError &&
        !_showExerciseDaysError;
  }

  Future<void> _saveForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setInt('age', int.parse(_ageController.text));
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
    await prefs.setString('gender', _selectedGender!);
    await prefs.setInt(
        'workoutDays', int.parse(_exerciseDaysController.text));
    await prefs.setBool('onboarding_completed', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildFirstPage(),
              _buildSecondPage(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFirstPage() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/cover.jpg'),
                //image: AssetImage('assets/semih.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text('Welcome to Pain4Gain!', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                const Text("Before we start,\nwe will need some information.", style: TextStyle(color: Colors.white, height: 1.4, fontSize: 18)),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(115, 85, 230, 100),
                        Color.fromRGBO(210, 121, 247, 100)
                        //Colors.yellow,
                        //Colors.orange
                      ]
                    )
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: _goToNextPage,
                    child: const Text("Start", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  child: Text("No Pain, No Gain!", style: TextStyle(color: Colors.white70, fontSize: 15),),
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(49, 14, 104, 1),
            Color.fromRGBO(94, 15, 65, 1),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'We need some information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'to create your account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _selectProfilePhoto,
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person, color: Colors.black54),
                      labelText: 'Enter your name',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      //errorText: _errors['name'],
                      errorMaxLines: 1,
                      errorStyle: TextStyle(),
                    ),
                  ),
                ),
                if (_showUsernameError == true)
                  const Text(
                    'Please enter a valid username',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          Icons.calendar_today, color: Colors.black54),
                      labelText: 'Enter your age',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                if (_showAgeError == true)
                  const Text(
                    'Please enter a valid age',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.height, color: Colors.black54),
                      labelText: 'Enter your height (cm)',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                if (_showHeightError == true)
                  const Text(
                    'Please enter a valid height',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          Icons.fitness_center, color: Colors.black54),
                      labelText: 'Enter your weight (kg)',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                if (_showWeightError == true)
                  const Text(
                    'Please enter a valid weight',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: _exerciseDaysController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          Icons.calendar_today, color: Colors.black54),
                      labelText: 'Enter number of workout days (1-7)',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                if (_showExerciseDaysError == true)
                  const Text(
                    'Please enter a valid day',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
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
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Radio<String>(
                          activeColor: Colors.white60,
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                      const Text(
                          'Male', style: TextStyle(color: Colors.white60)),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Radio<String>(
                          activeColor: Colors.white,
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                      const Text(
                          'Female', style: TextStyle(color: Colors.white60)),
                    ],
                  ),
                ),
                if (_showGenderError == true)
                  const Text(
                    'Please enter gender',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_validateForm()) {
                  _saveForm();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
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
//
