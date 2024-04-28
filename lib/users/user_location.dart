// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart'; // Import location package
import 'package:gebetamap/gebetamap.dart';

class PatientLocation extends StatefulWidget {
  const PatientLocation({super.key});


  @override
  State<PatientLocation> createState() => _PatientLocationState();
}

class _PatientLocationState extends State<PatientLocation> {


  late MapController _mapController;
  late Location _location; // Location instance

  var markerMap = <String,String>{};

  // Define GlobalKey here
  // final GlobalKey<OSMFlutter> mapKey = GlobalKey<OSMFlutter>();

  // final GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.listenerMapLongTapping.addListener(() async {
        //When Tap on Map we will add new marker
        var position = _mapController.listenerMapLongTapping.value;
        if(position != null){
          await _mapController.addMarker(position, markerIcon: const MarkerIcon(icon: Icon(Icons.pin_drop, color: Colors.blue, size: 48,),));

          // Add marker to map, for hold information of marker in case
          // we want to use it

          // var key = '${position!.latitude}_${position!.longitude}';
          var key = '${position.latitude}_${position.longitude}';
          markerMap[key] = markerMap.length.toString();
        }
      });
    });

    _mapController = MapController(
      initMapWithUserPosition: const UserTrackingOption(enableTracking: true, unFollowUser: false),
    );
    // _initializeMapController();
    _location = Location(); // Initialize Location
    _getDriverAndPatientLocations(); // Fetch driver and patient locations
  }
  // Function to fetch current location of driver and patient
  void _getDriverAndPatientLocations() async {
    // Get current location of driver
    LocationData? driverLocation = await _location.getLocation();
    double driverLatitude = driverLocation.latitude!;
    double driverLongitude = driverLocation.longitude!;

    // Get current location of patient
    // You need to implement a similar method to fetch patient's location

    // Get current location of patient
    double patientLatitude = 9.0; // Replace with actual patient latitude
    double patientLongitude = 38.0; // Replace with actual patient longitude
    // Calculate route between driver and patient
    _calculateRoute(driverLatitude, driverLongitude, patientLatitude, patientLongitude);
  }

  // Function to calculate route between driver and patient
  void _calculateRoute(double driverLat, double driverLng, double patientLat, double patientLng) async {
    // Call GebetaMap API function to calculate route between driver and patient
    GebetaMapRequest gmr = GebetaMapRequest();
    var directionStart = {'lat': driverLat, 'lon': driverLng};
    var directionStop = {'lat': patientLat, 'lon': patientLng};
    String apiKey = ""; // Your GebetaMap API key

    ResponseData routeData = await gmr.direction(directionStart, directionStop, apiKey);

    // Extract route information from routeData and update map
    // You need to implement this part to draw the route on the map
  }

  @override
  void dispose(){
    _mapController.dispose();
    super.dispose();
  }

  // void _initializeMapController() {
  //   _mapController = MapController(
  //     initPosition: GeoPoint(
  //       latitude: 7.6723,
  //       longitude: 36.8373,
  //     ),
  //   );
  // } //7.6723,36.8373 - Agricultural Campus

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tracking Patient Location',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: OSMFlutter(
        controller: _mapController,
        onMapIsReady: (isReady) async => {
          if(isReady){
            await Future.delayed(const Duration(seconds: 1), () async {
              await _mapController.currentLocation();
            })
          }
        },
        onGeoPointClicked: (geoPoint){
          var key = '${geoPoint.latitude}_${geoPoint.longitude}';
          // When user clicked marker
          
          showModalBottomSheet(context: context, builder: (context) {
            return  Card(
              child: Padding(padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Position ${markerMap[key]}', style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
                          const Divider(thickness: 1,),
                          Text(key,),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.clear),
                    )
                  ],
                ),
              ),

            );
          });
        },
        osmOption: OSMOption(
          // userTrackingOption: UserTrackingOption(
          //   enableTracking: true,
          //   unFollowUser: false,
          // ),
          zoomOption: const ZoomOption(
            initZoom: 16,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),

          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48,),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
