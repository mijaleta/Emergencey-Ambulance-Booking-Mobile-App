// ignore_for_file: prefer_const_constructors

import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/ambulance_search_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/edit_screen.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/forgot_password_page.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/hospital_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/nurse_page.dart';
import 'package:ambu_app/pages/reset_password.dart';
import 'package:ambu_app/pages/setting.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ambu_app/provider/request_provider.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/dispatcher_page.dart';
import 'package:ambu_app/pages/change_password.dart';
// import 'package:ambu_app/pages/login_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/signup_page.dart';
import 'package:ambu_app/pages/splash_screen.dart';
import 'package:ambu_app/pages/language_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Ambulance Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(),
        // '/loginPage': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/splash': (context) => SplashScreen(),
        '/languageSelection': (context) => LanguageSelectionPage(),
        '/ambulanceRequest': (context) => PatientRequestPage(),
        '/dispatcherPage': (context) => DispatcherPage(), // Fixed typo here
        '/changePasswordPage': (context) => ChangePasswordPage(),
        '/forgotPasswordPage': (context) => ForgotPasswordPage(),
        '/login': (context) => Login(),
        '/reset': (context) => ResetPasswordPage(),
        '/searchAmbulancePage': (context) => AmbulanceSearchPage(),
        'feedbackPage': (context) => FeedbackPage(),
        'accountPage': (context) => AccountScreen(),
        'editAccountScreen': (context) => EditAccount(),
        'registerAmbulance': (context) => RegisterAmbulance(),
        'logout': (context) => Logout(),
        'history': (context) => History(),
        'settings': (context) => SettingsScreen(),
        'nursePage': (context) => NursePage(),
        'driverPage': (context) => DriverPage(),
        'hospitalPage': (context) => HospitalPage(),
        'emergencyTypes': (context) => EmergencyTypeSelectionPage(),
      },
    );
  }
}
