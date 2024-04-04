import 'package:ambu_app/sidebar/NavBar.dart';
import 'package:ambu_app/sidebar/driver_sidebar.dart';
import 'package:ambu_app/sidebar/nurse_navbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  final Set<Marker> _markers = {};
  GoogleMapController? mapController;

  // Initial and destination positions (replace with your actual coordinates)
  final LatLng initialPosition =
      const LatLng(7.657066655358555, 36.84488862063615);
  final LatLng destinationPosition =
      const LatLng(7.598056219863879, 36.71631692063573);

  // Variable to store current user location
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    try {
      // Check permission before accessing location
      if (await _checkLocationPermission()) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
        });
      }
    } catch (e) {
      // Handle exceptions related to location access
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        stack: StackTrace.current,
      ));
      print('Error getting location: $e'); // Log the error for debugging
    }
  }

  Future<bool> _checkLocationPermission() async {
    var locationStatus = await Permission.location.request();

    if (locationStatus == PermissionStatus.granted) {
      return true;
    } else {
      // Handle permission denied or permanently denied cases here (similar to Option 1)
      print('Location permission not granted');
      return false;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      // Add marker for initial position
      _markers.add(
        Marker(
          markerId: const MarkerId('initial'),
          position: initialPosition,
          infoWindow: const InfoWindow(title: 'Initial Position'),
        ),
      );

      // Add marker for destination position
      _markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: destinationPosition,
          infoWindow: const InfoWindow(title: 'Destination Position'),
        ),
      );

      // Add marker for current location (if available)
      if (currentLocation != null) {
        _markers.add(
          Marker(
            markerId: const MarkerId('current'),
            position: currentLocation!,
            infoWindow: const InfoWindow(title: 'Current Location'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DriverNavBar(),
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
                // text: 'Details',
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
                // text: 'Details',
              ), // Placeholder for the other tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Map Tab
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: initialPosition,
                zoom: 12.0,
              ),
              markers: _markers,
            ),
            // Ambulance Information, Trip Information, and Driver Information Tab
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationDisplay(
                      label: 'Ambulance Information:',
                      children: [
                        Text(
                            'Vehicle details (type, model, registration number)'),
                        Text(
                            'Equipment inventory (medical supplies, specialized equipment)'),
                        Text('Maintenance schedule and status'),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Trip Information:',
                      children: [
                        Text(
                            'Patient details (name, age, condition, allergies, etc.) - Ensure patient privacy is protected.'),
                        Text(
                            'Pickup and drop-off locations with estimated arrival times'),
                        Text(
                            'Additional trip details (reason for call, dispatch instructions)'),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Driver Information:',
                      children: [
                        Text(
                            'Profile details (name, photo, license information)'),
                        Text('Shift schedule and availability'),
                        Text(
                            'Performance metrics (response times, patient satisfaction, etc.)'),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Functions:',
                      children: [
                        Text(
                            'Real-time Tracking: Show location of other ambulances and hospital availability.'),
                        Text(
                            'Two-way Communication: Text chat or voice call functionality with dispatch or hospital staff.'),
                        Text(
                            'Navigation: Integrate with Google Maps or other navigation systems for optimized routes.'),
                        Text(
                            'Reporting: Ability to submit incident reports with photos or voice recordings.'),
                        Text(
                            'Panic Button: Option to send a distress signal with location data in case of emergencies.'),
                        Text(
                            'Safety Checklist: Digital checklist to ensure proper equipment checks before and after each trip.'),
                        Text(
                            'Accept/Reject Trips: Option to accept or decline new trip requests based on availability or vehicle suitability.'),
                        Text(
                            'Mark Arrival/Departure: Easy way to update trip status at pickup and drop-off locations.'),
                        Text(
                            'Emergency Procedures: Access to protocols for handling various medical emergencies.'),
                        Text(
                            'Offline Functionality: Ability to access basic information and functionalities (e.g., ambulance details, safety checklists) even with limited internet connectivity.'),
                        Text(
                            'Notifications: Alerts for new trip requests, updates on existing trips, or important announcements.'),
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...children,
        SizedBox(height: 20),
      ],
    );
  }
}
