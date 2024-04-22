import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final _mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tracking Patient Location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: OSMFlutter(controller: _mapController,
          mapIsLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          osmOption: OSMOption(
            userTrackingOption: const UserTrackingOption(
              enableTracking: false,
              unFollowUser: true,
            ),
            initPosition: LatLng(latitude, longitude),
            // initPosition: GeoPoint(latitude: initialLatitude, longitude: initialLongitude),
            zoomOption:const ZoomOption(
              initZoom: 10,
              minZoomLevel: 4,
              maxZoomLevel: 15,
              stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
                personMarker:const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker:const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
            ),
            roadConfiguration:const RoadOption(
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker:const MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                )
            ),
          ),
      ),
    );
  }
}
