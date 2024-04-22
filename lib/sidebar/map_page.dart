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
              initZoom: 16,
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
            // markerOption: MarkerOption(
            //     defaultMarker: MarkerIcon(
            //       icon: Icon(
            //         Icons.person_pin_circle,
            //         color: Colors.blue,
            //         size: 56,
            //       ),
            //     )
            // ),
          ),
      ),
    );
  }
}