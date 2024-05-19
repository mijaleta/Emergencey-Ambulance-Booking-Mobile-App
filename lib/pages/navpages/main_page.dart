import 'package:ambu_app/pages/account_page.dart';
// import 'package:ambu_app/pages/feedback_page%20copy%202.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/services/home_services_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import '../feedback_page.dart';
import '../patient_req_example.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    OurServices(),
    // SearchPage(),
    // AccountScreen(),
    FeedbackPage(),
    RequestAmbulancePage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white, // Active color for all buttons
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Ionicons.apps_outline,
                text: 'Home',
              ),
              GButton(
                icon: Icons.medical_services_rounded,
                text: 'Services',
              ),
              GButton(
                icon: Icons.feedback,
                text: 'Feedback',
              ),
              GButton(
                icon: Icons.request_page_rounded,
                text: 'Book',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
