import 'package:flutter/material.dart';
import 'package:ambu_app/pages/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  // Sample image URLs, replace these with your own image URLs
  List<String> imageUrls = [
    'images/ambulance1.svg',
    'images/ambulance2.svg',
    'images/emergency.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Image.asset(
            "images/menu.png",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: null, // Remove the title
        actions: [
          IconButton(
            icon: Image.asset("images/notification-bell.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("images/user-icon.png"),
            onPressed: () {
              // ... (unchanged)
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text('Home Page'), // Home Page Implementation
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.transparent,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          buildCarousel(),
        ],
      ),
    );
  }

  Widget buildCarousel() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 120, // Adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    15.0), // Adjust the border radius as needed
                child: Image.network(
                  imageUrls[index],
                  width: 120, // Adjust the width as needed
                  height: 120, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
