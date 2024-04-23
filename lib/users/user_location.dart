import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class PatientLocation extends StatefulWidget {
  const PatientLocation({Key? key}) : super(key: key);

  @override
  State<PatientLocation> createState() => _PatientLocationState();
}

class _PatientLocationState extends State<PatientLocation> {
  final _mapController = MapController(
    initMapWithUserPosition: UserTrackingOption(enableTracking: true,unFollowUser: false)
  );

  @override
  void initState() {
    super.initState();
    // _initializeMapController();
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
            await Future.delayed(Duration(seconds: 1), () async {
              await _mapController.currentLocation();
            })
          }
        },
        osmOption: OSMOption(
          // userTrackingOption: UserTrackingOption(
          //   enableTracking: true,
          //   unFollowUser: false,
          // ),
          zoomOption: ZoomOption(
            initZoom: 16,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),

          userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
              icon: Icon(Icons.location_history_rounded, color: Colors.red, size: 48,),
            ),
            directionArrowMarker: MarkerIcon(
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
