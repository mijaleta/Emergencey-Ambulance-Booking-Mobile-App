import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ambu_app/services/constants.dart';
import 'package:ambu_app/users/user_location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:flutter/gestures.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_sms/flutter_sms.dart'; // Import flutter_sms
// import 'package:shared_preferences/shared_preferences.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  // String? fcmToken;
  // Future<void> _getFcmToken() async {
  //   fcmToken = await FirebaseMessaging.instance.getToken();
  //   print("FCM Token: $fcmToken");

  // Optionally, store the token in a database or server for later use
  // }

  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  // final Set<Marker> _markers = {};
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
    // _getFcmToken();
    // getLocationUpdates().then((_) => {
    //   getPolylinesPoints().then((coordinates) => {
    //     print(coordinates),
    //   },),
    // },
    // );

    // getPolylinesPoints().then((coordinates) {
    //   print("Polylines Coordinates: $coordinates");
    // }).catchError((error) {
    //   print("Error generating polylines: $error");
    // });
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

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  //   setState(() {
  //     // Add the current location marker here
  //     _markers.add(
  //       Marker(
  //         markerId: const MarkerId("_currentLocation"),
  //         icon: BitmapDescriptor.defaultMarker,
  //         position: _currentP!,
  //       ),
  //     );
  //   });
  // }

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
          title: const Text('Sending Panic Signal'),
          content:
              const Text('Please wait while the panic signal is being sent...'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
    Future.delayed(const Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Panic Signal Sent'),
            content: const Text('The panic signal has been successfully sent.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
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



  static const LatLng _pGooglePlex = LatLng(7.550783972794435, 36.869152651316064);
  static const LatLng _applePark = LatLng(7.7164763478329155, 36.80548802248252);
  LatLng? _currentP = null;
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
            _currentP == null ? const Center(child: Text("Loading..."),) : GoogleMap(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
              },
              onMapCreated: ((GoogleMapController controller) => _mapController.complete(controller) ),
              initialCameraPosition: const CameraPosition(
                target: _pGooglePlex,
                // LatLng(7.657066655358555, 36.84488862063615)
                zoom: 12.0,
              ),
              // markers: _markers,
              markers: {
                Marker(markerId: MarkerId("_currentLocation"), icon: BitmapDescriptor.defaultMarker, position: _currentP!),
                Marker(markerId: MarkerId("_sourceLocation"), icon: BitmapDescriptor.defaultMarker, position: _pGooglePlex),
                Marker(markerId: MarkerId("destinationLocation"), icon: BitmapDescriptor.defaultMarker, position: _applePark)
              },
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
                            // Request Call Permission
                            // var callPermissionStatus =
                            //     await Permission.phone.request();
                            // if (callPermissionStatus.isGranted) {
                            //   final Uri callUri =
                            //       Uri(scheme: 'tel', path: '+251961305788');
                            //   try {
                            //     await launchUrl(callUri);
                            //   } catch (e) {
                            //     print("Error launching call: $e");
                            //   }
                            // } else {
                            //   // Handle permission denied case
                            //   if (callPermissionStatus.isPermanentlyDenied) {
                            //     // Permission permanently denied, show a dialog to open app settings
                            //     await openAppSettings();
                            //   } else {
                            //     // Request permission again or show a snackbar with explanation
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: const Text(
                            //             'Call permission is required for making calls'),
                            //         action: SnackBarAction(
                            //           label: 'Request Permission',
                            //           onPressed: () =>
                            //               Permission.phone.request(),
                            //         ),
                            //       ),
                            //     );
                            //   }
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Call',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          // onPressed: sendPanicSignal,
                          onPressed: () async {
                            // Request SMS Permission
                            // var smsPermissionStatus =
                            //     await Permission.sms.request();
                            // if (smsPermissionStatus.isGranted) {
                            //   final Uri smsUri = Uri(
                            //     scheme: 'sms',
                            //     path: '+251961305788',
                            //     queryParameters: {
                            //       'body': 'Emergency: Need Help!'
                            //     },
                            //   );
                            //   if (await canLaunchUrl(smsUri)) {
                            //     try {
                            //       await launchUrl(smsUri);
                            //     } catch (e) {
                            //       print("Error launching SMS: $e");
                            //     }
                            //   } else {
                            //     print('Cannot launch this url');
                            //   }
                            // } else {
                            //   // Handle permission denied case
                            //   if (smsPermissionStatus.isPermanentlyDenied) {
                            //     // Permission permanently denied, show a dialog to open app settings
                            //     await openAppSettings();
                            //   } else {
                            //     // Request permission again or show a snackbar with explanation
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: const Text(
                            //             'SMS permission is required for sending messages'),
                            //         action: SnackBarAction(
                            //           label: 'Request Permission',
                            //           onPressed: () => Permission.sms.request(),
                            //         ),
                            //       ),
                            //     );
                            //   }
                            // }
                          },
                          child: const Text('Send Panic Signal'),
                        ),
                        ElevatedButton(
                          onPressed: performSafetyChecklist,
                          child: const Text('Perform Safety Checklist'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserLocationTracking()));
                          },
                          child: const Text('Track Patient'),
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

  Future<void> cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = new CameraPosition(target: pos, zoom: 13.0);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates () async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();

    if(_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    }else{
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude != null && currentLocation.longitude !=null){
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          cameraToPosition(_currentP!);
        });
      }
    });
  }

  // Future<List<LatLng>> getPolylinesPoints () async {
  //   List<LatLng> polylinesCoordinates = [];
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(GOOGLE_MAPS_API_KEY, PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude), PointLatLng(-_applePark.latitude, _applePark.longitude), travelMode: TravelMode.driving);
  //   if(result.points.isNotEmpty){
  //     result.points.forEach((PointLatLng point) {
  //       polylinesCoordinates.add(LatLng(point.latitude, point.longitude),);
  //     });
  //   }else{
  //     print(result.errorMessage);
  //   }
  //   return polylinesCoordinates;
  // }

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
