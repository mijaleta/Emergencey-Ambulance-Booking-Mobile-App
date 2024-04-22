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
    initPosition: GeoPoint(latitude: 7.784619644494936, longitude: 36.72530388570615),
    areaLimit: BoundingBox(
      east: 37.602588571093925, //Eastern Longtude
      north: 8.097725425956478,  //Northern Latitude
      south: 7.157504950238041,  //Southern Latitude
      west: 36.58595254315327,   //Western Longtude
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text('Tracking Patient Location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: OSMFlutter(
          controller: controller,
          osmOption: OSMOption(
            userTrackingOption: const UserTrackingOption(
              enableTracking: true,
              unFollowUser: false,
            ),
            zoomOption: const ZoomOption(
              initZoom: 15,
              minZoomLevel: 3,
              maxZoomLevel: 19,
              stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: const RoadOption(
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                )),
          ),
      ),
    );
  }
}