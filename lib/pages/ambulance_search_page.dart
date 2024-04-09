// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/sidebar/admin_sidebar.dart';
import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/back3.jpg"), // Change the path to your image
              fit: BoxFit.cover,
            ),
          ),
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
                              border: InputBorder.none, // Remove default border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Ambulance service and ranking items
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterAmbulance()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
