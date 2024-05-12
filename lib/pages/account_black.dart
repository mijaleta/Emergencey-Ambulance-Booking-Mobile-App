// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/edit_screen.dart';
import 'package:ambu_app/widgets/dark_setting.dart';
import 'package:ambu_app/widgets/forward_button.dart';
import 'package:ambu_app/widgets/setting_item.dart';
import 'package:ambu_app/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/dark_setting_switch.dart'; // Import Ionicons package

class AccountBlack extends StatefulWidget {
  const AccountBlack({super.key});

  @override
  State<AccountBlack> createState() => _AccountBlackState();
}

class _AccountBlackState extends State<AccountBlack> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        leadingWidth: 80,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              Text(
                "Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/my.jpg',
                        width: 70,
                        height: 70,
                      ),
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
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
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
                      width: 80,
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
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('Account',
              // style: TextStyle(fontSize: 24,
              // fontWeight: FontWeight.w500,),
              // ),
              // const SizedBox(height: 20,),
              DarkSettingItem(
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
              DarkSettingItem(
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
              DarkSettingSwitch(
                title: 'Dark Mode',
                icon: Ionicons.moon,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                onTap: (value) {
                  setState(() {
                    // isDarkMode = value;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountScreen()));
                  });
                },
                value: isDarkMode,
              ),
              DarkSettingItem(
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
