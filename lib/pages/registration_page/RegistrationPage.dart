import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pain4gain/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnboardingScreen extends StatefulWidget {
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
          int.tryParse(_heightController.text) == null ||
          int.parse(_heightController.text) < 70 ||
          int.parse(_heightController.text) > 250;
      _showWeightError = _weightController.text.isEmpty ||
          int.tryParse(_weightController.text) == null ||
          int.parse(_weightController.text) < 30 ||
          int.parse(_weightController.text) > 300;
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
    await prefs.setInt('height', int.parse(_heightController.text));
    await prefs.setInt('weight', int.parse(_weightController.text));
    await prefs.setString('gender', _selectedGender!);
    await prefs.setInt(
        'workoutDays', int.parse(_exerciseDaysController.text));
    await prefs.setBool('onboarding_completed', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  Widget _buildFirstPage() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Welcome to Pain4Gain!', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text("Before we start,\nwe will need some information.", style: TextStyle(color: Colors.white, height: 1.4, fontSize: 18)),
                SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
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
                    child: Text("Start", style: TextStyle(color: Colors.white)),
                    onPressed: _goToNextPage,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  child: Text("No Pain, No Gain!", style: TextStyle(color: Colors.white70, fontSize: 15),),
                ),

                SizedBox(
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

      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(49, 14, 104, 1),
              Color.fromRGBO(94, 15, 65, 1),
            ],
          )
      ),
      //color: Colors.indigo, // Customize the background color
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'We need some information',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'to create your account',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 24),
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
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  cursorColor: Colors.black38,
                  controller: _usernameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.person, color: Colors.black54),
                      labelText: 'Enter your name',
                      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                      //errorText: _errors['name'],
                      errorMaxLines: 1,
                      errorStyle: TextStyle()
                  ),
                ),
              ),
              if (_showUsernameError == true)
                Text('Please enter a valid username',
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),


            ],
          ),

          SizedBox(height: 10),

          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
              child: DropdownButtonFormField<String>(

                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16 ),
                  errorText: _showGenderError ? 'Please select a gender' : null,
                ),
              ),
            ),]
          ),
          SizedBox(height: 10),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  cursorColor: Colors.black38,
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.black54),
                    labelText: 'Enter your age',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              if (_showAgeError == true)
                Text('Please enter a valid age',
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
            ],
          ),

          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),

              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  cursorColor: Colors.black38,
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.height,color: Colors.black54),
                    labelText: 'Enter your height (cm)',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              if (_showHeightError == true)
                Text('Please enter a valid height',
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
            ],
          ),

          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  cursorColor: Colors.black38,
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.fitness_center, color: Colors.black54),
                    labelText: 'Enter your weight (kg)',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              if (_showWeightError == true)
                Text('Please enter a valid weight',
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
            ],
          ),

          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 175),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  cursorColor: Colors.black38,
                  controller: _exerciseDaysController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.black54),
                    labelText: 'Enter number of workout days (1-7)',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              if (_showExerciseDaysError == true)
                Text('Please enter a valid day',
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
            ],
          ),

          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_validateForm()) {
                _saveForm();
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildFirstPage(),
            _buildSecondPage(),
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
