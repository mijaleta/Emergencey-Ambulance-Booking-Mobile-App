// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:gebetamap/gebetamap.dart';


// Define the PatientLocation widget
class PatientLocation extends StatefulWidget {
  const PatientLocation({Key? key}) : super(key: key);

  @override
  State<PatientLocation> createState() => _PatientLocationState();
}

// Define the state for the PatientLocation widget
class _PatientLocationState extends State<PatientLocation> {
  final mongo.Db db = mongo.Db('mongodb://localhost:27017/location');
  // List<Polyline> _polylines = []; // List to store polylines
  late MapController _mapController;
  late Location _location;
  var markerMap = <String, String>{};

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initMapWithUserPosition: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );
    _location = Location();
    // Get user location and center the map on successful retrieval
    _determinePosition().then((Position position) async {
      // GeoPoint centerMap = await _mapController.centerMap;
      setState(() {
        // You can access the centered location details if needed (optional)
        // print('Map centered at: $centerMap');
      });
    }).catchError((error) {
      // Handle errors during location retrieval
      print('Error getting location: $error');
    });
    _getAndDisplayPatientLocation(); // Fetch and display patient's location
  }



  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  // Function to fetch and display the patient's location
  Future<void> _getAndDisplayPatientLocation() async {
    // Fetch patient's location based on their phone number
    String patientPhoneNumber = "+251961305788"; // Placeholder for patient's phone number
    var patientLocation = await fetchPatientLocation(patientPhoneNumber);

    // Extract latitude and longitude from the patient's location data
    double patientLatitude = patientLocation['latitude'];
    double patientLongitude = patientLocation['longitude'];

    // Update the map to display the patient's location
    setState(() {
      _mapController.addMarker(
        GeoPoint(latitude: patientLatitude, longitude: patientLongitude),
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.pin_drop, color: Colors.red, size: 48),
        ),
      );
    });

    // Fetch driver's location
    LocationData? driverLocation = await _location.getLocation();
    double driverLatitude = driverLocation!.latitude!;
    double driverLongitude = driverLocation.longitude!;

    // Calculate route between driver and patient
    await calculateRoute(driverLatitude, driverLongitude, patientLatitude, patientLongitude);
  }

  // Function to fetch patient's location from backend using Gebeta Map API
  Future<Map<String, dynamic>> fetchPatientLocation(String phoneNumber) async {
    GebetaMapRequest gmr = GebetaMapRequest();
    // You need to implement logic here to fetch patient's location based on their phone number using Gebeta Map API
    // Example:
    // var patientLocation = await gmr.geocode(phoneNumber, apiKey);
    // return {'latitude': patientLocation.latitude, 'longitude': patientLocation.longitude};
    return {
      'latitude': 7.694687998729552, // 7.694687998729552, 36.816481597954756 Placeholder for patient's latitude
      'longitude': 36.816481597954756, // Placeholder for patient's longitude
    };
  }

  List<LatLng> processResponsePath(ResponseData response) {
    // Assuming response.path is a list of route points (lat, lng)
    final routePoints = response.path.map((point) => LatLng(point[0], point[1])).toList();
    return routePoints;
  }
  // Function to calculate route between driver and patient using Gebeta Map API
  Future<void> calculateRoute(double driverLat, double driverLng, double patientLat, double patientLng) async {
    GebetaMapRequest gmr = GebetaMapRequest();
    var directionStart = {'lat': driverLat, 'lon': driverLng};
    var directionStop = {'lat': patientLat, 'lon': patientLng};
    String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg"; // Your Gebeta Map API key

    // Calculate route between driver and patient
    ResponseData routeData = await gmr.direction(directionStart, directionStop, apiKey);

    // Extract route information and update map
    // You need to implement this part to draw the route on the map
    // Future.delayed(const Duration(seconds: 1), () {
    //   print('Response message: ${routeData.message}');
    //   print('Response status: ${routeData.status}');
    //   print('path: ${routeData.path}');
    //   print('distance: ${routeData.totalDistance}');
    //   print('time: ${routeData.totaltime}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tracking Patient Location',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: OSMFlutter(
        controller: _mapController,

        onMapIsReady: (isReady) async {
          if (isReady) {
            await Future.delayed(const Duration(seconds: 1), () async {
              await _mapController.currentLocation();
              await _mapController.startLocationUpdating();
            });
          }
        },
        onGeoPointClicked: (geoPoint) {
          var key = '${geoPoint.latitude}_${geoPoint.longitude}';
          showModalBottomSheet(context: context, builder: (context) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Position ${markerMap[key]}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const Divider(thickness: 1),
                    Text(key),
                  ],
                ),
              ),
            );
          });
        },
        osmOption: OSMOption(
          zoomOption: const ZoomOption(
            initZoom: 16,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}

