// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/pages/edit_screen.dart';
import 'package:ambu_app/widgets/forward_button.dart';
import 'package:ambu_app/widgets/setting_item.dart';
import 'package:ambu_app/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // Import Ionicons package

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          // icon: Image.asset(
          //   "icons/beauty-back.jpg",
          //   color: Colors.black,
          // ),
          onPressed: () {},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        // title: const Text(
        //   'Booking Status',
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
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
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(
                      'icons/user-profile.png',
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Great Beki',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Dispatcher',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                    // const Spacer(),
                    SizedBox(
                      width: 114,
                    ),
                    ForwardButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditAccount()),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('Account',
              // style: TextStyle(fontSize: 24,
              // fontWeight: FontWeight.w500,),
              // ),
              // const SizedBox(height: 20,),
              SettingItem(
                title: 'Language',
                icon: Ionicons.earth,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
                value: 'English',
              ),
              const SizedBox(
                height: 20,
              ),
              SettingItem(
                title: 'Notification',
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
                // value: 'English',
              ),
              const SizedBox(
                height: 20,
              ),
              SettingSwitch(
                title: 'Dark Mode',
                icon: Ionicons.moon,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                onTap: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                value: isDarkMode,
              ),
              SettingItem(
                title: 'Help',
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
                // value: 'English',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
