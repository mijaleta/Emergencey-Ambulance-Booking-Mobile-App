import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ambu_app/users/myInput.dart';
import 'package:geodesy/geodesy.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'package:permission_handler/permission_handler.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final start = TextEditingController();
  final end = TextEditingController();
  // LatLng currentLocation = await _getCurrentLocation(); // Get current location from device

  bool isVisible = false;
  List<LatLng> routpoints = [LatLng(9.352951154649515, 42.80603840681846)];

  // Timer for continuous location updates
  Timer? locationUpdateTimer;


  @override
  void initState () {
    super.initState();
    requestLocationPermission();
    initializeCurrentLocation();
    // getCurrentLocation();
    //startLocationUpdates();
  }
  LatLng? currentLocation; // Nullable type to indicate that it might be null initially

  // Future<void> _initializeCurrentLocation() async {
  //   currentLocation = await _getCurrentLocation(); // Get current location from device
  //   // Optionally handle cases where currentLocation is null or not available
  // }
  Future<void> initializeCurrentLocation() async {
    await requestLocationPermission();
    await getCurrentLocation();
  }

  @override
  void dispose() {
    locationUpdateTimer?.cancel(); // Cancel timer on dispose
    super.dispose();
  }

  Future<bool> requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      await getCurrentLocation(); // Get location upon permission grant
      return true;
    } else {
      // Handle permission denied scenarios (e.g., show explanation)
      return false;
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String address = await getAddressFromLatLng(LatLng(position.latitude, position.longitude));

    // List<Location> locations = await locationFromAddress(address);
    // Print the result of locationFromAddress
    // print('locationFromAddress results: $locations');

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      start.text = address;
    });
  }


  Future<String> getAddressFromLatLng(LatLng latLng) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    return placemarks[0].name ?? ""; // Return address or empty string
  }




  // Method to start the timer for continuous location updates
  // void startLocationUpdates() {
  //   locationUpdateTimer = Timer.periodic(Duration(seconds: 30), (timer) {
  //     // Update the driver's location and route
  //     // updateDriverLocationAndRoute();
  //   });
  // }

  // Placeholder method to simulate getting the driver's current location
  // Future<LatLng> getCurrentDriverLocation() async {
  //   // For demonstration purposes, let's return a fixed location
  //   return LatLng(9.352951154649515, 42.80603840681846);
  // }

  // Method to fetch the current location of the user
  // void getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   // Reverse geocode to get address from the position
  //   List<Placemark> placemarks =
  //   await placemarkFromCoordinates(position.latitude, position.longitude);
  //   String address = placemarks[0].name ?? "";
  //   // Set the fetched address in the start text input field
  //   start.text = address;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Routing...',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[500],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyInput(controller: start, hint: 'Enter Starting PosCode'),
                  const SizedBox(height: 15,),
                  MyInput(controller: end, hint: 'Enter Ending PosCode'),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
                    // Inside onPressed method of ElevatedButton
                    onPressed: () async {
                      // Existing code to retrieve start and end locations
                      List<Location> start_l = await locationFromAddress(start.text);
                      List<Location> end_l = await locationFromAddress(end.text);

                      // Check if the auto-populated start location is a known location
                      if (start_l.isEmpty) {
                        // If the auto-populated start location is not a known location, use the current location
                        if (currentLocation != null) {
                          // Get nearby known locations using Overpass API
                          List<KnownLocation> nearbyLocations = await getNearbyKnownLocations(currentLocation!);
                          if (nearbyLocations.isNotEmpty) {
                            // Calculate distances between current location and nearby known locations
                            Map<KnownLocation, double> distances = {};
                            for (var location in nearbyLocations) {
                              double distance = calculateDistance(currentLocation!, location.coordinates);
                              distances[location] = distance;
                            }
                            // Choose the closest known location
                            var closestLocation = distances.entries.reduce((a, b) => a.value < b.value ? a : b).key;
                            // Use the closest known location as the starting point for the route
                            start.text = closestLocation.name; // Update start location input with closest known location name
                            // Calculate route from the closest known location to the end location
                            if (currentLocation != null) {
                              await calculateRouteAndDraw(currentLocation!, closestLocation.coordinates);
                            } else {
                              // Handle the case where currentLocation is null
                            }

                          } else {
                            // Handle scenario where no known locations are found nearby
                            print('No known locations found nearby');
                          }
                        } else {
                          // Handle scenario where current location is not available
                          print('Current location not available');
                        }
                      } else {
                        // If the auto-populated start location is a known location, proceed with existing code
                        // Get coordinates of the auto-populated start location
                        double v1 = start_l[0].latitude;
                        double v2 = start_l[0].longitude;
                        double v3 = end_l[0].latitude;
                        double v4 = end_l[0].longitude;
                        // Calculate route from the auto-populated start location to the end location
                        var url = Uri.parse('http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                        var response = await http.get(url);

                        setState(() {
                          routpoints = [];

                          var ruter = jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
                          for(int i= 0; i< ruter.length; i++){
                            var reep = ruter[i].toString();
                            reep = reep.replaceAll("[","");
                            reep = reep.replaceAll("]","");

                            var lat1 = reep.split(',');
                            var long1 = reep.split(",");

                            routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
                          }
                          print(routpoints);
                          isVisible = !isVisible;
                        });
                        print(response.body);
                      }
                    },

                    child: const Text('Press to Track...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 600,
                    width: 400,
                    child: Visibility(
                      visible: isVisible,
                      child: FlutterMap(
                        options: MapOptions(
                          center: routpoints[0],
                          zoom: 13,
                        ),
                        nonRotatedChildren:const [
                          RichAttributionWidget(
                            attributions: [
                              TextSourceAttribution(
                                'OpenStreetMap contributors',
                                // onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                              ),
                            ],
                          ),
                        ],
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          PolylineLayer(
                            polylineCulling: false,
                            polylines: [
                              Polyline(points: routpoints, color: Colors.red, strokeWidth: 9)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Define a method to calculate the distance between two sets of coordinates
  double calculateDistance(LatLng start, LatLng end) {
    // Calculate distance using the Haversine formula
    double distance = (Geodesy().distanceBetweenTwoGeoPoints(start, end)).toDouble();
    return distance;
  }


  // Define a method to fetch nearby known locations using the Overpass API
  Future<List<KnownLocation>> getNearbyKnownLocations(LatLng currentLocation) async {
    // Define the radius within which to search for nearby locations (in meters)
    final double searchRadius = 1000; // Adjust as needed

    // Placeholder list of known locations (replace with your actual logic to fetch locations from Overpass API)
    List<KnownLocation> knownLocations = [
      KnownLocation('Location 1', LatLng(9.352951154649515, 42.80603840681846)),
      KnownLocation('Location 2', LatLng(9.350000, 42.800000)), // Example known locations
      KnownLocation('Location 3', LatLng(9.355000, 42.810000)),
    ];

    // Filter locations within the search radius
    List<KnownLocation> nearbyLocations = knownLocations.where((location) {
      return Geodesy().distanceBetweenTwoGeoPoints(currentLocation, location.coordinates) <= searchRadius;
    }).toList();

    return nearbyLocations;
  }

  // Define a method to calculate the route from one set of coordinates to another and draw it on the map
  Future<void> calculateRouteAndDraw(LatLng start, LatLng end) async {
    // Implement the logic to calculate the route using a routing service like OSRM and draw it on the map
  }


// Future<bool> requestLocationPermission() async {
  //   var status = await Permission.locationWhenInUse.request();
  //   if (status.isGranted) {
  //     return true;
  //   } else {
  //     if (status.isDenied) {
  //       // Show an explanation to the user
  //       await showDialog(
  //         context: context,
  //         builder: (BuildContext context) => AlertDialog(
  //           title: Text('Location Permission Required'),
  //           content: Text('This app requires location access to function properly.'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     } else if (status.isPermanentlyDenied) {
  //       // Open app settings
  //       await openAppSettings();
  //     }
  //     return false;
  //   }
  // }

  // Method to update driver's location dynamically
  // void updateDriverLocation() async {
  //   // Replace this with actual code to get driver's location
  //   LatLng driverLocation = await getCurrentDriverLocation();
  //
  //   // Get patient's location from the text field
  //   List<Location> endLocation = await locationFromAddress(end.text);
  //   LatLng patientLocation = LatLng(endLocation[0].latitude, endLocation[0].longitude);
  //
  //   // Update the route based on the new driver's location
  //   // and patient's location
  //   updateRoute(driverLocation, patientLocation);
  // }

  // Call this method periodically or whenever you want to update the driver's location
  // void startUpdatingDriverLocation() {
  //   // Start a timer to periodically update the driver's location
  //   Timer.periodic(Duration(seconds: 30), (timer) {
  //     // Update driver's location
  //     updateDriverLocation();
  //   });
  // }

  // Method to update route dynamically
  // void updateRoute(LatLng driverLocation, LatLng patientLocation) async {
  //   var url = Uri.parse('http://router.project-osrm.org/route/v1/driving/'
  //       '${driverLocation.longitude},${driverLocation.latitude};'
  //       '${patientLocation.longitude},${patientLocation.latitude}'
  //       '?steps=true&annotations=true&geometries=geojson&overview=full');
  //
  //   var response = await http.get(url);
  //
  //   setState(() {
  //     routpoints = [];
  //
  //     var ruter = jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
  //     for(int i= 0; i< ruter.length; i++){
  //       var reep = ruter[i].toString();
  //       reep = reep.replaceAll("[","");
  //       reep = reep.replaceAll("]","");
  //
  //       var lat1 = reep.split(',');
  //       var long1 = reep.split(",");
  //
  //       routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
  //     }
  //     print(routpoints);
  //   });
  // }
}

// Define a simple class to represent a known location
class KnownLocation {
  final String name;
  final LatLng coordinates;

  KnownLocation(this.name, this.coordinates);
}
