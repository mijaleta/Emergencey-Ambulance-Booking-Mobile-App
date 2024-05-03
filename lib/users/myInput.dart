// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart'; // Import flutter_map package
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);
//
//   @override
//   State<MapPage> createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final locationController = Location();
//   final mapController = MapController();
//   LatLng? currentPosition;
//   LatLng? destinationLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       await fetchLocationUpdates();
//     });
//   }
//
//   void handleLocationChange(String value) async {
//     // Implement geocoding using an external service or manual mapping
//     // (Functionality currently not supported by Flutter Map)
//     print('Geocoding not yet implemented. Enter coordinates directly.');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Tracking Live Patient Location',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(16.0),
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Adjust the color as needed
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Enter patient location (latitude, longitude)',
//                 hintText: 'e.g., -33.8688, 151.2093',
//                 prefixIcon: Icon(Icons.location_pin),
//                 border: InputBorder.none, // Remove the border
//               ),
//               onChanged: handleLocationChange,
//             ),
//           ),
//           Expanded(
//             child: FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 center: currentPosition ?? LatLng(-33.8688, 151.2093), // Default location
//                 zoom: 13,
//               ),
//               layers: [
//                 TileLayerOptions( // Here's the corrected import
//                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   attributionBuilder: (_) => Text('Map data © OpenStreetMap contributors'),
//                 ),
//                 LocationMarkerLayerOptions(
//                   markers: [
//                     if (currentPosition != null)
//                       Marker(
//                         point: currentPosition!,
//                         builder: (_) => const Icon(Icons.location_on),
//                       ),
//                     if (destinationLocation != null)
//                       Marker(
//                         point: destinationLocation!,
//                         builder: (_) => const Icon(Icons.location_on),
//                       ),
//                   ],
//                 ),
//                 if (currentPosition != null && destinationLocation != null)
//                   PolylineLayerOptions(
//                     polylines: [
//                       Polyline(
//                         points: [currentPosition!, destinationLocation!],
//                         color: Colors.blue,
//                         strokeWidth: 3.0,
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> fetchLocationUpdates() async {
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;
//     serviceEnabled = await locationController.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await locationController.requestService();
//     } else {
//       return;
//     }
//
//     permissionGranted = await locationController.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await locationController.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     locationController.onLocationChanged.listen((currentLocation) {
//       if (currentLocation.latitude != null &&
//           currentLocation.longitude != null &&
//           currentLocation.accuracy! < 100) {
//         if (currentPosition == null ||
//             currentPosition != LatLng(currentLocation.latitude!, currentLocation.longitude!)) {
//           setState(() {
//             currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           });
//           print(currentPosition);
//         } else {
//           print('Current Position is not updating');
//         }
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
class MyInput extends StatefulWidget {
  final controller;
  final String hint;
  const MyInput({
    super.key,
    this.controller,
    required this.hint,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,

      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          )
      ),
    );
  }
}
