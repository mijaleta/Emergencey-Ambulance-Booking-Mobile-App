import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ambu_app/users/myInput.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart';
import 'dart:convert';


class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final start = TextEditingController();
  final end = TextEditingController();
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

                  print(start.text);
                  print(end.text);
                  },
                  child: Text('Press to Track...')
              )
            ],
          ),
        ),
      ),
    );
  }
}

