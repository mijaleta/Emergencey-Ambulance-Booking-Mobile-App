// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/widgets/forward_button.dart';
import 'package:ambu_app/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // Import Ionicons package

class AccounScreen extends StatefulWidget {
  const AccounScreen({super.key});

  @override
  State<AccounScreen> createState() => _AccounScreenState();
}

class _AccounScreenState extends State<AccounScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Image.asset(
            "icons/beauty-back.jpg",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        leadingWidth: 100,
        title: const Text(
          'Booking Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Text(
            "Account",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  '/icons/user-profile.png',
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Great Beki',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dispatcher',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                ForwardButton()
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          SettingItem()
        ],
      ),
    );
  }
}

