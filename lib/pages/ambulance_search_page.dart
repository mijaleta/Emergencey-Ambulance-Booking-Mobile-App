// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/helpPage.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/nurse_page.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/policies.dart';
import 'package:ambu_app/pages/setting.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class AmbulanceSearchPage extends StatelessWidget {
  const AmbulanceSearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('icons/menu.png'), // Custom menu icon
            onPressed: () {
              // Implement menu icon functionality
              Scaffold.of(context).openDrawer();
            },
            style: IconButton.styleFrom(
                hoverColor: Colors.white, focusColor: Colors.white),
          ),
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
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 83, 82, 82), // Set drawer background color
          padding: EdgeInsets.only(top: 100.0),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  "Book",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold), // Set text color
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DriverPage()),
                  ),
                },
                contentPadding: EdgeInsets.only(
                    left: 20.0), // Remove ListTile default padding
                horizontalTitleGap: 5, // Remove space between icon and text
                leading: Icon(
                  Icons.book,
                  color: Colors.white, // Set icon color
                ),
              ),
              ListTile(
                title: Text(
                  "History",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History()),
                  )
                },
                contentPadding: EdgeInsets.only(
                    left: 20.0), // Remove ListTile default padding
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Ambulance Types",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NursePage()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Request",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientRequestPage()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.request_page,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Policies",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Policies()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.policy,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Help",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Exit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  )
                },
                contentPadding: EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  child: Row(
                    children: [
                      SizedBox(
                          width: 8), // Add padding to the left side of the icon
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
                            border: InputBorder.none, // Remove default border
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Quick Ambulance Service',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RoundedCustomCard(
                    imagePath: 'images/ambublue.jpg',
                    title: 'Advanced Life Support',
                    subtitle: 'Critical Care Ambulance',
                  ),
                  RoundedCustomCard(
                    imagePath: 'images/ambusky.jpg',
                    title: 'Basic Life Support',
                    subtitle: 'Essential Care Transport',
                  ),
                  RoundedCustomCard(
                    imagePath: 'images/ambuwhite.jpg',
                    title: 'Medium Life Support',
                    subtitle: 'Medium Care Ambulance',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ambulance Ranking',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  RankingItem(
                      imagePath: 'images/login-background.jpg',
                      label: 'Advanced'),
                  RankingItem(
                      imagePath: 'images/sky-back.jpg', label: 'Medium'),
                  RankingItem(
                      imagePath: 'images/v-shape-back.jpg', label: 'Basic'),
                  RankingItem(
                      imagePath: 'assets/ambu-phone.png', label: 'Advanced'),
                  RankingItem(
                      imagePath: 'images/magaal-back.jpg', label: 'Basic'),
                  RankingItem(
                      imagePath: 'images/magaala-back.jpg', label: 'Medium'),
                  RankingItem(imagePath: 'images/red-back.jpg', label: 'Basic'),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add functionality for floating action button
      //   },
      //   child: Icon(Icons.add),
      // ),\
    );
  }
}

class RoundedCustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const RoundedCustomCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.asset(
              imagePath,
              width: 200,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            // padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24), // Increase font size
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            // padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 20), // Increase font size
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  // Add functionality for icon button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterAmbulance()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RankingItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const RankingItem({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16), // Increase font size
          ),
        ],
      ),
    );
  }
}
