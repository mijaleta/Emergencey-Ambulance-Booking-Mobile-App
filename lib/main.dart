// ignore_for_file: prefer_const_constructors
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/edit_screen.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/forgot_password_page.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/navpages/main_page.dart';
import 'package:ambu_app/pages/nurse_page.dart';

import 'package:ambu_app/pages/special_request_page.dart';
import 'package:ambu_app/services/home_services_page.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:ambu_app/users/user_location.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/change_password.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/signup_page.dart';
import 'package:ambu_app/pages/splash_screen.dart';
import 'package:ambu_app/pages/language_selection_page.dart';

import 'localizations/Afaan Oromo/home_page_dhukkubsataa.dart';
import 'localizations/Amharic/yetamami_home_page.dart';
import 'pages/account_black.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency Ambulance Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => SignupPage(),
        '/languageSelection': (context) => LanguageSelectionPage(),
        '/ambulanceRequest': (context) => PatientRequestPage(),
        '/changePasswordPage': (context) => ChangePasswordPage(),
        '/forgotPasswordPage': (context) => ForgotPasswordPage(),
        '/login': (context) => Login(),
        '/feedbackPage': (context) => FeedbackPage(),
        '/accountPage': (context) => AccountScreen(),
        '/editAccountScreen': (context) => EditAccount(),
        '/registerAmbulance': (context) => RegisterAmbulance(),
        '/logout': (context) => Logout(),
        '/history': (context) => History(),
        '/nursePage': (context) => NursePage(),
        '/driverPage': (context) => DriverPage(),
        '/emergencyTypes': (context) => EmergencyTypeSelectionPage(),
        '/specialRequest': (context) => SpecialRequestPage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/termsOfService': (context) => TermsOfServicePage(),
        '/driver': (context) => Driver(username: 'your_username_here'),
        '/nurse': (context) => Nurse(),
        '/blackAccount': (context) => AccountBlack(),
        '/servicesPage': (context) => OurServices(),
        '/afanOromoHomepage': (context) => HomePageDhukkubsataa(),
        '/amharicHomepage': (context) => AmharicHomePage(),
        '/mainPage': (context) => MainPage(),
        '/nursingPage': (context) => NursePage(),
      },
    ),
  );
}
