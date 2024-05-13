import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import '../../pages/feedback_page.dart';
import '../../pages/patient_req_example.dart';
import 'home_page_dhukkubsataa.dart';
import 'home_service.dart';

class OromiffaMainPage extends StatefulWidget {
  const OromiffaMainPage({super.key});

  @override
  State<OromiffaMainPage> createState() => _OromiffaMainPageState();
}

class _OromiffaMainPageState extends State<OromiffaMainPage> {
  List pages = [
    HomePageDhukkubsataa(),
    TajaajilootaKeenya(),
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
                icon: Ionicons.medical_outline,
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
