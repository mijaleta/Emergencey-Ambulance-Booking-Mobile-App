import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {

  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = Location();

    try {
      final LocationData locationData = await location.getLocation();
      setState(() {
        _currentLocation = locationData;
      });
    } catch (e) {
      throw ('Failed to get location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Car Emergency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Emergency Contact Numbers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            SizedBox(height: 8.0),
            Text('Roadside Assistance: +251 96 130 5788'),
            Text('Towing Services: +251 97 328 4058'),
            Divider(),
            Center(
              child: Text(
                'What to Do in Case of a Car Accident?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            SizedBox(height: 8.0),
            Text('1. Ensure Safety: Move to a safe location if possible.'),
            Text('2. Contact Emergency Services: Dial 911.'),
            Text('3. Check for Injuries: Administer basic first aid if trained.'),
            Divider(),
            Center(
              child: Text(
                'Basic First Aid for Common Car Accident Injuries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            SizedBox(height: 8.0),
            Text('1. CPR: Learn CPR techniques to assist someone in cardiac arrest.'),
            Text('2. Bleeding: Apply direct pressure to stop bleeding.'),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () => _launchPhoneCall('911'),
                child: Text(
                  'Call Emergency Services',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Map with Nearby Hospitals/Clinics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            // Add a map widget showing nearby hospitals/clinics
            _currentLocation != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 300.0,
                color: Colors.grey,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                    zoom: 13,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                      // attributionBuilder: (_) => Text('© OpenStreetMap contributors'),
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                          builder: (ctx) => Container(
                            child: Icon(Icons.location_on, size: 50, color: Colors.red),
                          ),
                        ),
                        // Add markers for nearby hospitals here
                      ],
                    ),
                  ],
                ),
              ),
            )
                : Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Additional Advice',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'If an accident occurs, make sure to document the scene and exchange insurance information with the other party involved.',
            ),
            SizedBox(height: 16.0),
            // Search for nearby hospitals/clinics
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // Implement search functionality based on current location
                  _searchNearbyHospitals();
                },
                child: Text('Find Nearby Hospitals', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch phone call
  void _launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to search nearby hospitals based on current location
  void _searchNearbyHospitals() {
    // Mock data for nearby hospitals
    // List<Hospital> nearbyHospitals = [
    //   Hospital(name: 'Hospital A', latitude: _currentLocation!.latitude! + 0.01, longitude: _currentLocation!.longitude! + 0.01),
    //   Hospital(name: 'Hospital B', latitude: _currentLocation!.latitude! - 0.02, longitude: _currentLocation!.longitude! + 0.02),
    //   Hospital(name: 'Hospital C', latitude: _currentLocation!.latitude! + 0.02, longitude: _currentLocation!.longitude! - 0.01),
    //   Hospital(name: 'Hospital D', latitude: _currentLocation!.latitude! - 0.01, longitude: _currentLocation!.longitude! - 0.02),
    // ];

    // Implement further logic to handle the list of nearby hospitals
    // For now, let's print the names of the nearby hospitals
    // for (var hospital in nearbyHospitals) {
    //   print('Hospital Name: ${hospital.name}');
    // }
  }

}

// class Hospital {
//   final String name;
//   final double latitude;
//   final double longitude;
//
//   Hospital({
//     required this.name,
//     required this.latitude,
//     required this.longitude,
//   });
// }
class Hospital {
  final String name;
  final LatLng location;

  Hospital({required this.name, required this.location});
}

class HospitalService {
  static List<Hospital> getNearbyHospitals(LatLng userLocation) {
    // Simulate fetching nearby hospitals based on user's location
    // Replace this with actual search functionality using APIs
    return [
      Hospital(name: 'Hospital A', location: LatLng(40.7128, -74.0060)),
      Hospital(name: 'Hospital B', location: LatLng(40.7129, -74.0061)),
      Hospital(name: 'Hospital C', location: LatLng(40.7130, -74.0062)),
    ];
  }
}

class LocationService {
  static Future<LocationData?> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      print('Failed to get location: $e');
      return null;
    }
  }
}

class HospitalList extends StatelessWidget {
  final List<Hospital> hospitals;

  HospitalList({required this.hospitals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(hospitals[index].name),
          subtitle: Text('Distance: ${calculateDistance(hospitals[index].location)} miles'),
          // Add onTap functionality to handle hospital selection
        );
      },
    );
  }

  double calculateDistance(LatLng hospitalLocation) {
    // Simulate distance calculation based on user's location
    // Replace this with actual distance calculation using location coordinates
    return 2.5;
  }
}

class NavigationService {
  static void navigateToHospital(LatLng hospitalLocation) async {
    // Launch navigation app with directions to the hospital
    final url = 'https://www.google.com/maps/dir/?api=1&destination=${hospitalLocation.latitude},${hospitalLocation.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

