import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/sidebar/nurse_navbar.dart';

class Nurse extends StatefulWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  State<Nurse> createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NurseNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Nurse',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                launchScheduleURL(); // Function to launch the URL
              },
              child: Text(
                'View Schedule Online',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch the URL
  void launchScheduleURL() async {
    const url = 'https://ambulance-website.samiintegratedfarm.com/scheduleNurseAndDriver'; // Replace with your schedule website URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
