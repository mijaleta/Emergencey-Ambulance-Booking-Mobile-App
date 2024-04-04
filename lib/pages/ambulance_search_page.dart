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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Ionicons.menu_outline), // Custom menu icon
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
              // Drawer items
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
            // Ambulance service and ranking items
          ],
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
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: Text('Admin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
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
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 20),
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
      ),
    );
  }
}

class RankingItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const RankingItem({
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
