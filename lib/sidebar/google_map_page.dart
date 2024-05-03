import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ambu_app/users/myInput.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Routing...',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              MyInput(controller: start, hint: 'Enter Starting PosCode'),
              const SizedBox(height: 15,),
              MyInput(controller: end, hint: 'Enter Ending PosCode'),
              const SizedBox(height: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[500],),
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
                  
                  
                  var url = Uri.parse('http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson');

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

                      routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[1])));
                    }
                    // print(routpoints);
                    isVisible = !isVisible;
                  });
                  // print(response.body);
                  // print(start_l);
                  // print(v1);
                  // print(v2);
                    
                    
                  },
                  child: Text('Press to Track...'),
              ),
              SizedBox(height: 10,),
              FlutterMap(
                options: MapOptions(
                  center: routpoints[0],
                  zoom: 14,
                ),
                children: [  // Use children for regular layers
                  // Add your tile layers and other map elements here
                ],
                // Use nonRotatedChildren specifically for attribution (assuming it's available)
                nonRotatedChildren: [

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

