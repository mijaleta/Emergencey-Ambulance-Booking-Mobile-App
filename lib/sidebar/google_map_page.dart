import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ambu_app/users/myInput.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart'; // Import geolocator package


class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final start = TextEditingController();
  final end = TextEditingController();
  bool isVisible = false;
  List<LatLng> routpoints = [LatLng(9.352951154649515, 42.80603840681846)];


  @override
  void initState (){
    super.initState();
    getCurrentLocation();
  }
  // Placeholder method to simulate getting the driver's current location
  Future<LatLng> getCurrentDriverLocation() async {
    // For demonstration purposes, let's return a fixed location
    return LatLng(9.352951154649515, 42.80603840681846);
  }

  // Method to fetch the current location of the user
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // Reverse geocode to get address from the position
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    String address = placemarks[0].name ?? "";
    // Set the fetched address in the start text input field
    start.text = address;
  }


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
                      onPressed: () async {
                      List<Location> start_l = await locationFromAddress(start.text);
                      List<Location> end_l = await locationFromAddress(end.text);

                      // print(start.text);
                      // print(end.text);
                      // print(start_l);
                      // print(end_l);

                      var v1 =start_l[0].latitude;
                      var v2 =start_l[0].longitude;
                      var v3 =end_l[0].latitude;
                      var v4 =end_l[0].longitude;


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
                      // print(start_l);
                      // print(v1);
                      // print(v2);
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

  // Method to update driver's location dynamically
  void updateDriverLocation() async {
    // Replace this with actual code to get driver's location
    LatLng driverLocation = await getCurrentDriverLocation();

    // Get patient's location from the text field
    List<Location> endLocation = await locationFromAddress(end.text);
    LatLng patientLocation = LatLng(endLocation[0].latitude, endLocation[0].longitude);

    // Update the route based on the new driver's location
    // and patient's location
    updateRoute(driverLocation, patientLocation);
  }

  // Call this method periodically or whenever you want to update the driver's location
  void startUpdatingDriverLocation() {
    // Start a timer to periodically update the driver's location
    Timer.periodic(Duration(seconds: 30), (timer) {
      // Update driver's location
      updateDriverLocation();
    });
  }

  // Method to update route dynamically
  void updateRoute(LatLng driverLocation, LatLng patientLocation) async {
    var url = Uri.parse('http://router.project-osrm.org/route/v1/driving/'
        '${driverLocation.longitude},${driverLocation.latitude};'
        '${patientLocation.longitude},${patientLocation.latitude}'
        '?steps=true&annotations=true&geometries=geojson&overview=full');

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
    });
  }
}

