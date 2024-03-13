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
    'assets/ambulancea.png',
    'assets/ambulanceb.png',
    'assets/emergencyc.jpg',
  ];

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
        title: null, // Remove the title
        actions: [
          IconButton(
            icon: Image.asset("icons/notification-bell.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("icons/user-icon.png"),
            onPressed: () {
              // Navigate to login page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Increased margin between app bar and images
          buildCarousel(),
          SizedBox(height: 20), // Increased margin between images and text
          const Center(
            child: Text('Home Page'), // Home Page Implementation
          ),
          SizedBox(height: 16), // Increased margin below the text
        ],
      ),
    );
  }

  Widget buildCarousel() {
    return Container(
      height: 120, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imageUrls[index],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
