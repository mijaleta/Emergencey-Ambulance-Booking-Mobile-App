import 'package:flutter/material.dart';
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_search_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/pages/patient_request_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of image URLs
  final List<String> imageUrls = [
    'assets/ambulancea.png',
    // 'assets/ambulanceb.png',
    'assets/emergencyc.jpg',
    'assets/ambu-blue.jpg',
    'assets/ambu-keyboard.jpg',
  ];

  // Dropdown menu items
  final List<String> dropdownItems = [
    'Account',
    'Search',
    'Settings',
    'Logout',
  ];

  String? selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Image.asset(
            "icons/menu.png",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset("icons/notification-bell.png"),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: Image.asset("icons/user-icon.png"),
            onSelected: (String value) {
              // Update the selectedMenuItem variable
              setState(() {
                selectedMenuItem = value;
              });

              // Handle menu item selection here
              if (selectedMenuItem == 'Account') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AccountPage()),
                // );
              } else if (selectedMenuItem == 'Search') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AmbulanceSearchPage()),
                );
              } else if (selectedMenuItem == 'Settings') {
                // Handle settings navigation
              } else if (selectedMenuItem == 'Logout') {
                // Handle logout navigation
              }
            },
            itemBuilder: (BuildContext context) {
              return dropdownItems.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0), // Add padding around the content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Ambulance Booking', // Add the text here
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Display images in two columns and three rows
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        imageUrls[index],
                        height: 150, // Set a fixed height for the images
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientRequestPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Book Ambulance",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "It's your lifeline in critical situations, connecting you promptly to the support needed during emergencies.",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ).copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add extra spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
