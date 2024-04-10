// ignore_for_file: prefer_const_constructors

import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ambu_app/provider/request_provider.dart';
// import 'package:ambu_app/models/request.dart'; // Import the request model if available

class DispatcherPage extends StatelessWidget {
  const DispatcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    // int requestCount = Provider.of<RequestProvider>(context).getRequestCount();
    // int requestCount = Provider.of<RequestProvider>(context).requestCount;
    // List<Request> requests = Provider.of<RequestProvider>(context)
    //     .getRequests(); // Assuming you have a method to get requests

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Image.asset(
              "icons/menu.png",
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'Booking Status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Image.asset("icons/notification-bell.png"),
                  onPressed: () {},
                ),
                // requestCount > 0
                //     ? Positioned(
                //         right: 8,
                //         top: 8,
                //         child: CircleAvatar(
                //           backgroundColor:
                //               const Color.fromARGB(255, 251, 251, 251),
                //           radius: 10,
                //           child: Text(
                //             requestCount.toString(),
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 12,
                //             ),
                //           ),
                //         ),
                //       )
                //     : SizedBox(),
              ],
            ),
            IconButton(
              icon: Image.asset("icons/user-icon.png"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientRequestPage()));
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Change Password" button press
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ChangePasswordPage()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Dispatch',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
