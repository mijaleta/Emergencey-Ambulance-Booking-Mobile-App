import 'package:ambu_app/pages/animal_page.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/helpPage.dart';
import 'package:ambu_app/pages/navpages/main_page.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:flutter/material.dart';

import '../amarigna_main.dart';
import '../hrequest/hrequest.dart';

class HSideBar extends StatelessWidget {
  HSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              accountName: const Text(
                'ወደ ፈጣን አምቡላንስ አገልግሎት \nእንኳን በደህና መጡ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                'ተጠቃሚ',
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
              'የተጠቃሚ አገልግሎቶች',
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
                  'መነሻ ገጽ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AmarignaMainPage()));
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
                  'አሁን ያዝ!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HRequestAmbulancePage()));
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
                  'እገዛ',
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
                  'ተገናኝ',
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
                  'የአገልግሎት ውሎች',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const TermsOfServicePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip), // Use the built-in "privacy_tip" icon for Privacy Policy
                title: const Text(
                  'የ ግል ፖሊሲ',
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