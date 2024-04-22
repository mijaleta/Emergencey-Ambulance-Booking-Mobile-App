// import 'package:flutter/material.dart';
// import 'package:flutter_joystick/flutter_joystick.dart';
// import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
//
//
//
//
// class UserLocationTracking extends StatefulWidget {
//   const UserLocationTracking({super.key});
//
//   @override
//   State<UserLocationTracking> createState() => _UserLocationTrackingState();
// }
//
// class _UserLocationTrackingState extends State<UserLocationTracking> {
//   final Location location = Location();
//   LocationData? _currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     _startLocationTracking();
//   }
//
//   Future<void> _startLocationTracking() async {
//     final Location location = Location();
//     await location.requestPermission();
//     location.onLocationChanged.listen((LocationData currentLocation) {
//       setState(() {
//         _currentLocation = currentLocation;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Location Tracking', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//       ),
//       // body: content(),
//     );
//   }
// }
//
// Widget content() {
//   return FlutterMap(options: MapOptions(initialCenter: LatLng(7.6802,36.8536),
//     initialZoom: 11,
//     interactionOptions:  InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
//   ),
//       children: [
//         openStreetMapTileLayer,
//         MarkerLayer(markers: [
//           Marker(point: LatLng(7.759748095288982, 36.77603137837566), //Yebu High School
//             // 7.689303781049675, 36.820944344148565- Jimma Admin
//             width: 60,
//             height: 60,
//             alignment: Alignment.centerLeft,
//             child: GestureDetector(
//               onTap: (){
//                 //Navigate to another screen
//               },
//               child: Icon(
//                 Icons.location_pin,
//                 size: 60,
//                 color: Colors.red,
//               ),
//             ),
//
//           ),
//           Marker(point: LatLng(7.6666054585661705, 36.820813706221394), //Seka
//             // 7.689303781049675, 36.820944344148565 - Jimma Admin
//             // 7.6666054585661705, 36.820813706221394 - Jimma Airport
//             //7.729363388775918, 37.114044758335794 - Daraba
//             width: 60,
//             height: 60,
//             alignment: Alignment.centerLeft,
//             child: GestureDetector(
//               onTap: (){
//                 //Navigate to another screen
//               },
//               child: Icon(
//                 Icons.location_pin,
//                 size: 60,
//                 color: Colors.red,
//               ),
//             ),
//
//           ),
//           Marker(point: LatLng(7.706696724430544, 36.93328532400528), //Seka
//             // 7.689303781049675, 36.820944344148565 - Jimma Admin
//             // 7.6666054585661705, 36.820813706221394 - Jimma Airport
//             //7.729363388775918, 37.114044758335794 - Daraba
//             //7.706696724430544, 36.93328532400528 - Babo
//             //7.715925138290464, 37.09576282153653 - Bulbul Health Center
//             width: 60,
//             height: 60,
//             alignment: Alignment.centerLeft,
//             child: GestureDetector(
//               onTap: (){
//                 //Navigate to another screen
//               },
//               child: Icon(
//                 Icons.location_pin,
//                 size: 60,
//                 color: Colors.red,
//               ),
//             ),
//
//           ),
//         ]),
//       ],
//   );
// }
// TileLayer get openStreetMapTileLayer => TileLayer(
//   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//   // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png ',
//   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
// );