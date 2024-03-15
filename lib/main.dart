import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ambu_app/provider/request_provider.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/dispatcher_page.dart';
import 'package:ambu_app/pages/change_password.dart';
import 'package:ambu_app/pages/login_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/signup_page.dart';
import 'package:ambu_app/pages/splash_screen.dart';
import 'package:ambu_app/pages/language_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestProvider(),
      child: MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/splash': (context) => SplashScreen(),
          '/languageSelection': (context) => LanguageSelectionPage(),
          '/ambulanceRequest': (context) => PatientRequestPage(),
          '/dispatcherPage': (context) => DispatcherPage(), // Fixed typo here
          '/changePasswordPage': (context) => ChangePasswordPage(),
        },
      ),
    );
  }
}
