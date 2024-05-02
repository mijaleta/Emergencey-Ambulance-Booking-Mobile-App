


import 'package:flutter/material.dart';
import 'package:gebetamap/gebetamap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong2/latlong.dart' as latlang;
import 'package:location/location.dart';

// Replace with your actual GebetaMap API key
// const String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final locationController = Location();
  LatLng? currentPosition;
  LatLng? destinationLocation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await fetchLocationUpdates();
    });
  }

  Future<void> callGeoCode(String locationText) async {
    String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg"; // Your API Key
    GebetaMapRequest gmr = new GebetaMapRequest();
    ResponseData rs = await gmr.geocode(locationText, apiKey);
    print(rs.data);
  }
// Define a method to handle text field value changes and call callGeoCode
  void handleLocationChange(String value) async {
    await callGeoCode(value);
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Adjust the color as needed
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter patient location',
                hintText: 'e.g., Latitude, Longitude',
                prefixIcon: Icon(Icons.location_pin),
                border: InputBorder.none, // Remove the border
              ),
              onChanged: handleLocationChange,
            ),
          ),

          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentPosition ?? LatLng(0.0, 0.0),
                zoom: 13,
              ),
              markers: _buildMarkers(),
              polylines: _buildPolylines(),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};
    if (currentPosition != null) {
      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: currentPosition!,
        ),
      );
    }
    if (destinationLocation != null) {
      markers.add(
        Marker(
          markerId: MarkerId('destinationLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: destinationLocation!,
        ),
      );
    }
    return markers;
  }

  Set<Polyline> _buildPolylines() {
    Set<Polyline> polylines = {};
    if (currentPosition != null && destinationLocation != null) {
      polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          color: Colors.blue,
          width: 3,
          points: [currentPosition!, destinationLocation!],
        ),
      );
    }
    return polylines;
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null &&
          currentLocation.accuracy! < 100) {
        if (currentPosition == null ||
            currentPosition !=
                LatLng(currentLocation.latitude!, currentLocation.longitude!)) {
          setState(() {
            currentPosition =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });
          print(currentPosition);
        } else {
          print('Current Position is not updating');
        }
      }
    });
  }
}