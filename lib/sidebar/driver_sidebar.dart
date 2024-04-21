import 'package:ambu_app/pages/account_page.dart';
import 'package:flutter/material.dart';

import 'diriver_map.dart';

// import 'diriver_map.dart';

class DriverNavBar extends StatelessWidget {
  const DriverNavBar({super.key});

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
                  image: AssetImage('icons/patient.png'),
                  height: 40,
                  width: 40,
                ),
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
                trailing: ClipOval(
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: const Center(
                        child: Text(
                      '8',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverMap(),),);
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
                onTap: () {},
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()),);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
