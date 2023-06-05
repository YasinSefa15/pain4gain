import 'package:flutter/material.dart';
import 'package:pain4gain/AppPage.dart';
import 'package:pain4gain/pages/registration_page/RegistrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool('onboarding_completed', false);
    if (prefs.getBool('onboarding_completed') != null &&
        prefs.getBool('onboarding_completed') == true) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pain4Gain',
      home: SafeArea(
        child: FutureBuilder<bool>(
          future: _checkOnboardingStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Veri henüz yüklenmediyse, örneğin loading spinner gösterebilirsiniz.
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Hata durumunda, hata mesajını gösterebilirsiniz.
              return Center(child: Text('Hata: ${snapshot.error}'));
            } else {
              // Veri yüklendiğinde, onboarding_completed değerine göre ekranı belirleyebilirsiniz.
              bool? onboardingCompleted = snapshot.data;
              if (onboardingCompleted == true) {
                // Onboarding tamamlandıysa AppPage gösterilir.
                return const AppPage();
              } else {
                // Onboarding tamamlanmadıysa OnboardingScreen gösterilir.
                return OnboardingScreen();
              }
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
