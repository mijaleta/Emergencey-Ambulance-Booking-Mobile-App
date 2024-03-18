// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AmbulanceSearchPage extends StatelessWidget {
  const AmbulanceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('icons/menu.png'), // Custom menu icon
          onPressed: () {
            // Implement menu icon functionality
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('icons/user-icon.png'), // Custom user icon
            onPressed: () {
              // Implement user icon functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'icons/search-interface-symbol.png',
                    width: 30,
                    height: 30,
                  ), // Custom search icon
                  fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  filled: true,
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // borderSide: BorderSide.none,
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
              ),
            ),
            // Containers with customizable images and details
            // Auto sliding can be implemented using ListView or PageView
            // Ambulance Ranking
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ambulance Ranking',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image containers with respective texts
                  // Customize image containers as required
                  Column(
                    children: [
                      Image.asset(
                        'images/ambublue.jpg', // Customize icon path
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        'Advanced Life Support',
                        style: TextStyle(fontSize: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Critical Care Ambulance')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/ambusky.jpg', // Customize icon path
                        width: 100,
                        height: 100,
                      ),
                      Text('Basic Life Support'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Essential Care Transport')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/ambuwhite.jpg', // Customize icon path
                        width: 100,
                        height: 100,
                      ),
                      Text('Medium Life Support'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Medium Care Ambulance',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500,
                          // overflow: non
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
