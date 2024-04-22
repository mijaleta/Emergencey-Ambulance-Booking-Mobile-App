// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// // import 'package:latlong2/latlong.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({super.key});
//
//   @override
//   State<MapPage> createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//
//   // final _mapController = MapController();
//   MapController controller = MapController(
//     // initMapWithUserPosition:const UserTrackingOption(enableTracking: true),
//     // 7.784619644494936,36.72530388570615 - Yebu
//     initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
//     // 7.982809678028841,37.602588571093925- Eastward
//     // 7.854413004279108,36.58595254315327 - Westward
//     // 8.097725425956478,36.948449961475696 - Northward
//     // 7.157504950238041,36.27244434676297 - Southward
//
//     // areaLimit: BoundingBox(
//     //   east: 10.4922941,
//     //   north: 47.8084648,
//     //   south: 45.817995,
//     //   west: 5.9559113,
//     // ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text('Tracking Patient Location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
//       ),
//       body: OSMFlutter(controller: controller,
//           // mapIsLoading: const Center(
//           //   child: CircularProgressIndicator(),
//           // ),
//           osmOption: OSMOption(
//             // LatLng(7.918164044939249,37.43457959255435),
//             userTrackingOption: const UserTrackingOption(
//               // enableTracking: false,
//               unFollowUser: true,
//             ),
//
//             // initPosition: GeoPoint(latitude: initialLatitude, longitude: initialLongitude),
//             zoomOption:const ZoomOption(
//               initZoom: 15,
//               minZoomLevel: 4,
//               maxZoomLevel: 19,
//               stepZoom: 1.0,
//             ),
//             userLocationMarker: UserLocationMaker(
//                 personMarker:const MarkerIcon(
//                   icon: Icon(
//                     Icons.location_history_rounded,
//                     color: Colors.red,
//                     size: 48,
//                   ),
//                 ),
//                 directionArrowMarker:const MarkerIcon(
//                   icon: Icon(
//                     Icons.double_arrow,
//                     size: 48,
//                   ),
//                 ),
//             ),
//             roadConfiguration:const RoadOption(
//               roadColor: Colors.yellowAccent,
//             ),
//             markerOption: MarkerOption(
//                 defaultMarker:const MarkerIcon(
//                   icon: Icon(
//                     Icons.person_pin_circle,
//                     color: Colors.blue,
//                     size: 56,
//                   ),
//                 )
//             ),
//           ),
//       ),
//     );
//   }
// }
