import 'package:flutter/material.dart';
import 'package:ambu_app/pages/login_page.dart'; // Update the import statement
import 'package:ambu_app/pages/home_page.dart'; // Import the home page
import 'package:ambu_app/pages/signup_page.dart'; // Import Sign Up page 
import 'package:ambu_app/pages/splash_screen.dart'; // Import the splash screen page
import 'package:ambu_app/pages/language_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Set initial route to splash screen
      routes: {
        // Register the home page route
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(), // Register the Login page route
        '/signup': (context) => SignupPage(), // Register the signup page route
        '/splash': (context) =>
            SplashScreen(), // Register the splash screen route
        '/languageSelection': (context) =>
            LanguageSelectionPage(), // Language selection route
      },
    );
  }
}
