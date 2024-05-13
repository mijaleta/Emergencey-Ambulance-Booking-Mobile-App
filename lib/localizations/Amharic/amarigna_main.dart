import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/navpages/search_page.dart';
import 'package:ambu_app/services/home_services_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import 'agalgilot.dart';
import 'yetamami_home_page.dart';

class AmarignaMainPage extends StatefulWidget {
  const AmarignaMainPage({super.key});

  @override
  State<AmarignaMainPage> createState() => _AmarignaMainPageState();
}

class _AmarignaMainPageState extends State<AmarignaMainPage> {
  List pages = [
    AmharicHomePage(),
    YegnaAgalgilot(),
    // SearchPage(),
    AccountScreen(),
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
            tabs:const [
              GButton(
                icon: Ionicons.apps_outline,
                text: 'Home',
              ),
              GButton(
                icon: Ionicons.medical_outline,
                text: 'Services',
              ),
              GButton(
                icon: Ionicons.search_outline,
                text: 'Search',
              ),
              GButton(
                icon: Ionicons.settings_outline,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
