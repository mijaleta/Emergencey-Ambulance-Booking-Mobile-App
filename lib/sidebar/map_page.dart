import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:http/http.dart' as http;
import 'package:gebetamap/gebetamap.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // List<dynamic> listOfPoints = [];
  // List<LatLng> points = [];
  List<LatLng> points = [];
  final String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg"; // Replace with your actual API key

  Future<void> calculateRoute(double driverLat, double driverLng, double patientLat, double patientLng) async {
    try {
      GebetaMapRequest gmr = GebetaMapRequest();
      var directionStart = {'lat': driverLat, 'lon': driverLng};
      var directionStop = {'lat': patientLat, 'lon': patientLng};

      ResponseData rds = await gmr.direction(directionStart, directionStop, apiKey);

      if (rds.status == "success") {
        if (rds.path != null) {
          points = rds.path.map((e) => LatLng(e['lat'] as double, e['lon'] as double)).toList();
          setState(() {}); // Update UI with new route
          print('Extracted coordinates: $points');
        } else {
          print("Route coordinates not found in response");
        }
      } else {
        print("Error: API call failed. Reason: ${rds.message}");
      }
    } catch (e) {
      print("Error fetching route coordinates: $e");
    }
  }

  // Assuming you have functions to fetch patient and driver locations (replace with your implementation)
  Future<double> getPatientLatitude() async {
    // Implement logic to fetch patient's latitude
    return 7.697165300922039; // Placeholder value, replace with actual data
  }

  Future<double> getPatientLongitude() async {
    // Implement logic to fetch patient's longitude
    return 36.8149151878519; // Placeholder value, replace with actual data
  }

  Future<double> getDriverLatitude() async {
    // Implement logic to fetch driver's latitude
    return 7.712294604883809; // Placeholder value, replace with actual data
  }

  Future<double> getDriverLongitude() async {
    // Implement logic to fetch driver's longitude
    return 36.80699730678395; // Placeh-older value, replace with actual data
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
      body: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          zoom: 14,
          center: LatLng(7.694687998729552, 36.816481597954756),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Plenty of other options available!
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(7.697165300922039, 36.8149151878519),
                width: 80,
                height: 80,
                builder: (context) => IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  color: Colors.red,
                ),
              ),
              Marker(
                point: LatLng(7.712294604883809, 36.80699730678395),
                width: 80,
                height: 80,
                builder: (context) => IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          if (points.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: points,
                  color: Colors.red,
                  strokeWidth: 5,
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          double patientLat = await getPatientLatitude();
          double patientLng = await getPatientLongitude();
          double driverLat = await getDriverLatitude();
          double driverLng = await getDriverLongitude();

          // Calculate route using the fetched locations
          await calculateRoute(driverLat, driverLng, patientLat, patientLng);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
