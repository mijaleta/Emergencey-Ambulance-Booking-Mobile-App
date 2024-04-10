// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/services/home_services_page.dart';
import 'package:ambu_app/sidebar/admin_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class AmbulanceSearchPage extends StatelessWidget {
  const AmbulanceSearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Admin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Image.asset('icons/user-icon.png'), // Custom user icon
            onPressed: () {
              // Implement user icon functionality
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/back3.jpg"), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),

        // physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Explore our services",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          SizedBox(
                              width:
                                  8), // Add padding to the left side of the icon
                          Image.asset(
                            'icons/search-interface-symbol.png',
                            width: 24, // Reduce the size of the icon
                            height: 24,
                          ),
                          SizedBox(
                              width:
                                  8), // Add padding between the icon and the text field
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border:
                                    InputBorder.none, // Remove default border
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Ambulance service and ranking items

              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'By signing up or sending request, you agree to our Terms of Service and Privacy Policy.',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TermsOfServicePage()),
                          );
                        },
                        child: const Text(
                          'Terms of Service',
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Text(
                        ' and ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PrivacyPolicyPage()));
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.yellow,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              switch (index) {
                case 0: // Navigate to Home page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 1: // Navigate to Services page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OurServices()),
                  );
                  break;
                case 2: // Navigate to Search page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AmbulanceSearchPage()),
                  );
                  break;
                case 3: // Navigate to Settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OurServices()),
                  );
                  break;

                default:
                  break;
              }
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.medical_services_outlined,
                text: 'Services',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
