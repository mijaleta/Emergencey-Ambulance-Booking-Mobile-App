import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_sms/flutter_sms.dart'; // Import flutter_sms
// import 'package:shared_preferences/shared_preferences.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  final Set<Marker> _markers = {};
  GoogleMapController? mapController;

  // Placeholder for fetched data
  String ambulanceInfo = 'Loading...';
  String tripInfo = 'Loading...';
  String driverInfo = 'Loading...';

  @override
  void initState() {
    super.initState();
    // Fetch data from schedule, dispatcher, and database
    fetchAmbulanceInfo();
    fetchTripInfo();
    fetchDriverInfo();
    getConnectivity();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && !isAlertSet) {
          showDialogBox();
          isAlertSet = true;
        }
      },
    );
  }

  // Placeholder functions for fetching data
  void fetchAmbulanceInfo() {
    // Simulate fetching ambulance information from schedule
    setState(() {
      ambulanceInfo =
          'Ambulance Type: XYZ\nModel: ABC\nRegistration Number: 123';
    });
  }

  void fetchTripInfo() {
    // Simulate fetching trip information from dispatcher
    setState(() {
      tripInfo =
          'Patient Name: Great Beki\nAge: 35\nCondition: Stable\nAllergies: None\nPickup Location: ABC Hospital\nDrop-off Location: XYZ Clinic\nEstimated Arrival: 10 minutes';
    });
  }

  void fetchDriverInfo() {
    // Simulate fetching driver information from database
    setState(() {
      driverInfo =
          'Name: Miretu Jaleta\nLicense: ABC123\nShift Schedule: 8 AM - 5 PM\nPerformance: Excellent';
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // You can add map markers here if needed
  }

  // Placeholder functions for additional functionalities
  void startCommunication() {
    // Start communication with dispatcher or hospital staff
    // Implement your logic here
  }

  void reportIncident() {
    // Report incident with photos or voice recordings
    // Implement your logic here
  }

  void sendPanicSignal() {
    // Send distress signal with location data
    // Implement your logic here

    // Example: Show a dialog indicating that the panic signal is being sent
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sending Panic Signal'),
          content: Text('Please wait while the panic signal is being sent...'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Simulate sending the panic signal (Replace with actual logic)
    // Here, we'll use flutter_sms to send the message
    // sendSMS(
    //   message: 'Emergency: Need Help!',
    //   recipients: ['+251717904888'], // Replace with the desired phone number
    // );

    // Example: Show a success dialog after sending the panic signal
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Panic Signal Sent'),
            content: Text('The panic signal has been successfully sent.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  void performSafetyChecklist() {
    // Perform digital checklist for equipment checks
    // Implement your logic here
  }

  void markArrivalDeparture() {
    // Mark arrival/departure at pickup and drop-off locations
    // Implement your logic here
  }

  void accessEmergencyProcedures() {
    // Access protocols for handling medical emergencies
    // Implement your logic here
  }

  void receiveNotifications() {
    // Receive alerts for new trip requests, updates, or announcements
    // Implement your logic here
  }

  showDialogBox() => showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('No Connection!'),
          content: const Text('Please check your internet connection!'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'OK');
                isAlertSet = false;
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Driver',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: ClipOval(
                  child: Image.asset(
                    'icons/google-maps.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Tab(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/44.jpg',
                    width: 40.0, // Adjust width and height as needed
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Map Tab
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(7.657066655358555, 36.84488862063615),
                zoom: 12.0,
              ),
              markers: _markers,
            ),
            // Ambulance, Trip, and Driver Information Tab
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationDisplay(
                      label: 'Ambulance Information',
                      children: [
                        Text(ambulanceInfo),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Trip Information',
                      children: [
                        Text(tripInfo),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Driver Information',
                      children: [
                        Text(driverInfo),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Functions',
                      children: [
                        ElevatedButton(
                          onPressed: startCommunication,
                          child: const Text('Start Communication'),
                        ),
                        ElevatedButton(
                          onPressed: reportIncident,
                          child: const Text('Report Incident'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final Uri url =
                                Uri(scheme: 'tel', path: '+251961305788');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Call'),
                        ),
                        ElevatedButton(
                          // onPressed: sendPanicSignal,
                          onPressed: () async {
                            final Uri url = Uri(
                                scheme: 'sms',
                                path: '+251961305788',
                                queryParameters: {
                                  'body': 'Emergency: Need Help!',
                                });
                            if(await canLaunchUrl(url)){
                              await launchUrl(url);
                            } else{
                              print('Cannot launch this url');
                            }

                          },
                          child: const Text('Send Panic Signal'),
                        ),
                        ElevatedButton(
                          onPressed: performSafetyChecklist,
                          child: const Text('Perform Safety Checklist'),
                        ),
                        ElevatedButton(
                          onPressed: markArrivalDeparture,
                          child: const Text('Mark Arrival/Departure'),
                        ),
                        ElevatedButton(
                          onPressed: accessEmergencyProcedures,
                          child: const Text('Access Emergency Procedures'),
                        ),
                        ElevatedButton(
                          onPressed: getConnectivity,
                          child: const Text('Access Offline Functionality'),
                        ),
                        ElevatedButton(
                          onPressed: receiveNotifications,
                          child: const Text('Receive Notifications'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for displaying information
  Widget informationDisplay(String label, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(data),
        const SizedBox(height: 20),
      ],
    );
  }
}

class InformationDisplay extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const InformationDisplay({
    Key? key,
    required this.label,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 20),
      ],
    );
  }
}
