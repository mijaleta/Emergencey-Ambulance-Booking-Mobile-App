import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:gebetamap/gebetamap.dart'; // Import GebetaMap API

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController controller = MapController(
    // 7.784619644494936,36.72530388570615 - Yebu
    // 7.658815818923218,36.82208057454223 - Jimma
    initPosition: GeoPoint(latitude: 7.6942, longitude: 36.8135),
    areaLimit: BoundingBox(
      east: 36.974, //Eastern Longtude 7.7091, 36.974
      north: 7.9049,  //Northern Latitude  7.9049, 36.7905
      south: 7.5046,  //Southern Latitude  7.5046, 36.8821
      west: 36.6394,   //Western Longtude  7.6624, 36.6394
    ),
  );
  // or set manually init position
  // final controller = MapController.withPosition(
  //   initPosition: GeoPoint(
  //     latitude: 7.784619644494936,
  //     longitude: 36.72530388570615,
  //   ),
  // );

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text('Tracking Patient Location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: OSMFlutter(
          controller:controller,
          osmOption: OSMOption(
            userTrackingOption: UserTrackingOption(
              enableTracking: true,
              unFollowUser: false,
            ),
            zoomOption: ZoomOption(
              initZoom: 8,
              minZoomLevel: 3,
              maxZoomLevel: 19,
              stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: RoadOption(
              roadColor: Colors.yellowAccent,
            ),
            // markerOption: MarkerOption(
            //     defaultMarker: MarkerIcon(
            //       icon: Icon(
            //         Icons.person_pin_circle,
            //         color: Colors.blue,
            //         size: 56,
            //       ),
            //     )
            // ),
          )
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//
// class PatientLocation extends StatefulWidget {
//   @override
//   _PatientLocationState createState() => _PatientLocationState();
// }
//
// class _PatientLocationState extends State<PatientLocation> {
//   final GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();
//
//   Future<void> getMyLocation() async {
//     try {
//       GeoPoint p = await mapKey.currentState.myLocation();
//       double lat = p.latitude;
//       double lon = p.longitude;
//       print("latitude is: $lat, longitude is: $lon");
//     } on GeoPointException catch (e) {
//       print("${e.errorMessage()}");
//     }
//   }
//
//   Future<void> drawRoadOnMap() async {
//     try {
//       await mapKey.currentState.drawRoad(
//         GeoPoint(latitude: 28.596429, longitude: 77.190628),
//         GeoPoint(latitude: 28.4573802, longitude: 73.1424312),
//       );
//     } on RoadException catch (e) {
//       print("${e.errorMessage()}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'Tracking Patient Location',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: OSMFlutter(
//         key: mapKey,
//         controller: MapController(
//           initMapWithUserPosition: UserTrackingOption(
//             enableTracking: true,
//             unFollowUser: false,
//           ),
//         ),
//         osmOption: OSMOption(
//           zoomOption: ZoomOption(
//             initZoom: 16,
//             minZoomLevel: 3,
//             maxZoomLevel: 19,
//             stepZoom: 1.0,
//           ),
//           userLocationMarker: UserLocationMaker(
//             personMarker: MarkerIcon(
//               icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48,),
//             ),
//             directionArrowMarker: MarkerIcon(
//               icon: Icon(
//                 Icons.location_history_rounded,
//                 color: Colors.red,
//                 size: 48,
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getMyLocation,
//         tooltip: 'Get My Location',
//         child: Icon(Icons.location_on),
//       ),
//     );
//   }
// }