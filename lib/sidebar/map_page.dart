import 'dart:convert';

import 'package:ambu_app/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  List listOfPoints = [];
  List<LatLng> points = [];

  //Function that consume the openrouteservices API
  getCoordinates() async {
    var response = await http.get(getRouteUrl("36.8149151878519c,7.697165300922039", "36.8416139276352, 7.694018027280917"));

    setState(() {
      if(response.statusCode == 200 ) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];

        points = listOfPoints.map((e) => LatLng(e[1].toDouble(), e[0].toDouble())).toList();
      }
    });
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
                point: LatLng(7.694018027280917, 36.8416139276352),
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
          PolylineLayer(
            polylines: [
              Polyline(
                points: points,
                color: Colors.blue,
                strokeWidth: 5,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getCoordinates();
        },
        tooltip: 'Increament',
        child: const Icon(Icons.add),
      ),
    );
  }
}
