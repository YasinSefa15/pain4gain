import 'package:flutter/material.dart';
import 'package:pain4gain/pages/home_page/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _checkOnboardingStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final bool showOnboarding = snapshot.data ?? true;
            return showOnboarding ? OnboardingScreen() : HomePage();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? true;
  }
}

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
      duration: Duration(milliseconds: 500),
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
          int.parse(_ageController.text) < 6 ||
          int.parse(_ageController.text) > 101;
      _showHeightError = _heightController.text.isEmpty ||
          int.tryParse(_heightController.text) == null ||
          int.parse(_heightController.text) < 140 ||
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
    await prefs.setBool('onboarding_completed', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Widget _buildFirstPage() {
    return Container(
      color: Colors.indigo, // Customize the background color
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/welcome_image.png'),
          SizedBox(height: 24),
          Text(
            'Welcome to Pain4Gain',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: _goToNextPage,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondPage() {
    return Container(
      color: Colors.indigo, // Customize the background color
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'We need some information from you:',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Username',
              errorText: _showUsernameError ? 'Please enter a valid username' : null,
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
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
              labelText: 'Gender',
              errorText: _showGenderError ? 'Please select a gender' : null,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              errorText: _showAgeError ? 'Please enter a valid age' : null,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Height(cm)',
              errorText:
              _showHeightError ? 'Please enter a valid height' : null,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight(kg)',
              errorText:
              _showWeightError ? 'Please enter a valid weight' : null,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _exerciseDaysController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Days of Exercise per Week',
              errorText:
              _showExerciseDaysError ? 'Please enter a valid day' : null,
            ),
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
}

