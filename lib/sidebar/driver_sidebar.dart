import 'package:ambu_app/helpers/demomap.dart';
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'patient_tracking.dart';

class DriverNavBar extends StatefulWidget {
  const DriverNavBar({super.key});

  @override
  State<DriverNavBar> createState() => _DriverNavBarState();
}

class _DriverNavBarState extends State<DriverNavBar> {

  // for logout
  Future<void> _logout() async {
    final url = Uri.parse('http://ambulance-website.samiintegratedfarm.com/logout');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Clear user data from SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('username');
        // Redirect to Login page
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('Logout failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during logout: $e');
    }
  }
// for logout
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              accountName: const Text(
                'Great Bekele',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                'Driver',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/44.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profileback.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Emergency Responses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                leading: const Image(
                  image: AssetImage('icons/speedometer.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Driver Dashboard',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Driver(username: '',)));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage('icons/starambu.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Ambulances',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage('icons/google-maps.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Track Patient',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>const PatientTrackingPage()));
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const PatientTrackingPage()));
                  // callMapFunctions();  PatientLocation
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverMap(),),);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage('icons/phone.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Contact',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const CallScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              ListTile(
                leading: const Image(
                  image: AssetImage('icons/setting.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const AccountScreen()),);
                },
              ),

              const Divider(),
              ListTile(
                leading:const Icon(
                  Icons.logout, // Use the built-in logout icon
                  size: 40,
                  color: Colors.red, // Change the color of the icon
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: _logout,
              ),
            ],
          )
        ],
      ),
    );
  }

  // Function to handle map-related functionality
  void callMapFunctions()  {
    // Call the map-related functions here
    //  callDirection();
     // callMatrix();
     // callTss();
     // callOneToMany();
     // callGeoCode();
  }
}
