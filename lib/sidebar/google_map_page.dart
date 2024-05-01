


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong2/latlong.dart' as latlang;
import 'package:location/location.dart';

// Replace with your actual GebetaMap API key
const String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final locationController = Location();
  static const  googlePlex = LatLng(7.694687998729552, 36.816481597954756);
  static const  mountainview = LatLng(7.7176078060398625, 36.80540921925276);
  // 7.7176078060398625, 36.80540921925276 - Walda Amanuel
  // 7.697165300922039, 36.8149151878519 - The first

  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>await fetchLocationUpdates());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tracking Live Patient Location',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition:const CameraPosition(
          target:googlePlex,
          zoom: 13,
        ),
        markers: {
          const Marker(markerId: MarkerId('currentLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: googlePlex,
          ),
          const Marker(markerId: MarkerId('destinationLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: mountainview,
          ),
        },
      ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if(serviceEnabled){
      serviceEnabled = await locationController.requestService();
    }
    else{
      return;
    }
    permissionGranted = await locationController.hasPermission();
    if(permissionGranted == PermissionStatus.denied){
      permissionGranted = await locationController.requestPermission();
      if(permissionGranted != PermissionStatus.granted){
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null&& currentLocation.accuracy! < 100) {
        if (currentPosition == null || currentPosition != LatLng(currentLocation.latitude!, currentLocation.longitude!)) {
          setState(() {
            currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });
          print(currentPosition);
        }
        else{
          print('Current Position is not updating');
        }
      }
    });
  }
}
