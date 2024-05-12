import 'package:ambu_app/pages/animal_page.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/helpPage.dart';
import 'package:ambu_app/pages/navpages/main_page.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:flutter/material.dart';

class CommonSideBar extends StatelessWidget {
  const CommonSideBar({super.key});

  @override
  Widget build(BuildContext context) {
        return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              accountName: const Text(
                'Welcome to Quick \nAmbulance Service',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                'User',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
              'User Services',
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
                  'Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                },
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // ListTile(
              //   leading: const Image(
              //     image: AssetImage('icons/starambu.png'),
              //     height: 40,
              //     width: 40,
              //   ),
              //   title: const Text(
              //     'Ambulances',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //   ),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => LabourPage()));
              //   },
              // ),
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
                  'Book Now!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalPage()));
                },
                // trailing: ClipOval(
                //   child: Container(
                //     color: Colors.red,
                //     width: 20,
                //     height: 20,
                //     child: const Center(
                //         child: Text(
                //       '8',
                //       style: TextStyle(color: Colors.white, fontSize: 12),
                //     )),
                //   ),
                // ),
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
                  'Help',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.assignment), // Use the built-in "assignment" icon for Terms of Services
                title: const Text(
                  'Terms Of Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const TermsOfServicePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip), // Use the built-in "privacy_tip" icon for Privacy Policy
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const PrivacyPolicyPage()));
                },
              ),

            ],
          )
        ],
      ),
    );
  }
}