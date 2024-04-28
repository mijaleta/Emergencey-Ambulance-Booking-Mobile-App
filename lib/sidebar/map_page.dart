// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:gebetamap/gebetamap.dart'; // Import GebetaMap API
//
// class MapPage extends StatefulWidget {
//   const MapPage({super.key});
//
//   @override
//   State<MapPage> createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   MapController controller = MapController(
//     // 7.784619644494936,36.72530388570615 - Yebu
//     // 7.658815818923218,36.82208057454223 - Jimma
//     initPosition: GeoPoint(latitude: 7.6942, longitude: 36.8135),
//     areaLimit: BoundingBox(
//       east: 36.974, //Eastern Longtude 7.7091, 36.974
//       north: 7.9049,  //Northern Latitude  7.9049, 36.7905
//       south: 7.5046,  //Southern Latitude  7.5046, 36.8821
//       west: 36.6394,   //Western Longtude  7.6624, 36.6394
//     ),
//   );
//   // or set manually init position
//   // final controller = MapController.withPosition(
//   //   initPosition: GeoPoint(
//   //     latitude: 7.784619644494936,
//   //     longitude: 36.72530388570615,
//   //   ),
//   // );
//
//   @override
//   void dispose(){
//     super.dispose();
//     controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title:const Text('Tracking Patient Location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
//       ),
//       body: OSMFlutter(
//           controller:controller,
//           osmOption: OSMOption(
//             userTrackingOption: UserTrackingOption(
//               enableTracking: true,
//               unFollowUser: false,
//             ),
//             zoomOption: ZoomOption(
//               initZoom: 8,
//               minZoomLevel: 3,
//               maxZoomLevel: 19,
//               stepZoom: 1.0,
//             ),
//             userLocationMarker: UserLocationMaker(
//               personMarker: MarkerIcon(
//                 icon: Icon(
//                   Icons.location_history_rounded,
//                   color: Colors.red,
//                   size: 48,
//                 ),
//               ),
//               directionArrowMarker: MarkerIcon(
//                 icon: Icon(
//                   Icons.double_arrow,
//                   size: 48,
//                 ),
//               ),
//             ),
//             roadConfiguration: RoadOption(
//               roadColor: Colors.yellowAccent,
//             ),
//             // markerOption: MarkerOption(
//             //     defaultMarker: MarkerIcon(
//             //       icon: Icon(
//             //         Icons.person_pin_circle,
//             //         color: Colors.blue,
//             //         size: 56,
//             //       ),
//             //     )
//             // ),
//           )
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// //
// // class PatientLocation extends StatefulWidget {
// //   @override
// //   _PatientLocationState createState() => _PatientLocationState();
// // }
// //
// // class _PatientLocationState extends State<PatientLocation> {
// //   final GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();
// //
// //   Future<void> getMyLocation() async {
// //     try {
// //       GeoPoint p = await mapKey.currentState.myLocation();
// //       double lat = p.latitude;
// //       double lon = p.longitude;
// //       print("latitude is: $lat, longitude is: $lon");
// //     } on GeoPointException catch (e) {
// //       print("${e.errorMessage()}");
// //     }
// //   }
// //
// //   Future<void> drawRoadOnMap() async {
// //     try {
// //       await mapKey.currentState.drawRoad(
// //         GeoPoint(latitude: 28.596429, longitude: 77.190628),
// //         GeoPoint(latitude: 28.4573802, longitude: 73.1424312),
// //       );
// //     } on RoadException catch (e) {
// //       print("${e.errorMessage()}");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.blue,
// //         title: Text(
// //           'Tracking Patient Location',
// //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
// //         ),
// //       ),
// //       body: OSMFlutter(
// //         key: mapKey,
// //         controller: MapController(
// //           initMapWithUserPosition: UserTrackingOption(
// //             enableTracking: true,
// //             unFollowUser: false,
// //           ),
// //         ),
// //         osmOption: OSMOption(
// //           zoomOption: ZoomOption(
// //             initZoom: 16,
// //             minZoomLevel: 3,
// //             maxZoomLevel: 19,
// //             stepZoom: 1.0,
// //           ),
// //           userLocationMarker: UserLocationMaker(
// //             personMarker: MarkerIcon(
// //               icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48,),
// //             ),
// //             directionArrowMarker: MarkerIcon(
// //               icon: Icon(
// //                 Icons.location_history_rounded,
// //                 color: Colors.red,
// //                 size: 48,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: getMyLocation,
// //         tooltip: 'Get My Location',
// //         child: Icon(Icons.location_on),
// //       ),
// //     );
// //   }
// // }

// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:gebetamap/gebetamap.dart';

// Define the PatientLocation widget
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

// Define the state for the PatientLocation widget
class _MapPageState extends State<MapPage> {
  final mongo.Db db = mongo.Db('mongodb://localhost:27017/location');
  late MapController _mapController;
  late Location _location;
  var markerMap = <String, String>{};

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initMapWithUserPosition: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );
    _location = Location();
    _getAndDisplayPatientLocation(); // Fetch and display patient's location
  }

  // Function to fetch and display the patient's location
  Future<void> _getAndDisplayPatientLocation() async {
    // Fetch patient's location based on their phone number
    String patientPhoneNumber = ""; // Placeholder for patient's phone number
    var patientLocation = await fetchPatientLocation(patientPhoneNumber);

    // Extract latitude and longitude from the patient's location data
    double patientLatitude = patientLocation['latitude'];
    double patientLongitude = patientLocation['longitude'];

    // Update the map to display the patient's location
    setState(() {
      _mapController.addMarker(
        GeoPoint(latitude: patientLatitude, longitude: patientLongitude),
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.pin_drop, color: Colors.red, size: 48),
        ),
      );
    });

    // Fetch driver's location
    LocationData? driverLocation = await _location.getLocation();
    double driverLatitude = driverLocation!.latitude!;
    double driverLongitude = driverLocation.longitude!;

    // Calculate route between driver and patient
    await calculateRoute(driverLatitude, driverLongitude, patientLatitude, patientLongitude);
  }

  // Function to fetch patient's location from backend using Gebeta Map API
  Future<Map<String, dynamic>> fetchPatientLocation(String phoneNumber) async {
    GebetaMapRequest gmr = GebetaMapRequest();
    // You need to implement logic here to fetch patient's location based on their phone number using Gebeta Map API
    // Example:
    // var patientLocation = await gmr.geocode(phoneNumber, apiKey);
    // return {'latitude': patientLocation.latitude, 'longitude': patientLocation.longitude};
    return {
      'latitude': 9.0, // Placeholder for patient's latitude
      'longitude': 38.0, // Placeholder for patient's longitude
    };
  }

  // Function to calculate route between driver and patient using Gebeta Map API
  Future<void> calculateRoute(double driverLat, double driverLng, double patientLat, double patientLng) async {
    GebetaMapRequest gmr = GebetaMapRequest();
    var directionStart = {'lat': driverLat, 'lon': driverLng};
    var directionStop = {'lat': patientLat, 'lon': patientLng};
    String apiKey = ""; // Your Gebeta Map API key

    // Calculate route between driver and patient
    ResponseData routeData = await gmr.direction(directionStart, directionStop, apiKey);

    // Extract route information and update map
    // You need to implement this part to draw the route on the map
    print('Response message: ${routeData.message}');
    print('Response status: ${routeData.status}');
    print('path: ${routeData.path}');
    print('distance: ${routeData.totalDistance}');
    print('time: ${routeData.totaltime}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tracking Patient Location',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: OSMFlutter(
        controller: _mapController,
        onMapIsReady: (isReady) async {
          if (isReady) {
            await Future.delayed(const Duration(seconds: 1), () async {
              await _mapController.currentLocation();
            });
          }
        },
        onGeoPointClicked: (geoPoint) {
          var key = '${geoPoint.latitude}_${geoPoint.longitude}';
          showModalBottomSheet(context: context, builder: (context) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Position ${markerMap[key]}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const Divider(thickness: 1),
                    Text(key),
                  ],
                ),
              ),
            );
          });
        },
        osmOption: OSMOption(
          zoomOption: const ZoomOption(
            initZoom: 16,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}

