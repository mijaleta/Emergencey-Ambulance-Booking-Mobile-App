// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class PatientLocation extends StatefulWidget {
  const PatientLocation({super.key});


  @override
  State<PatientLocation> createState() => _PatientLocationState();
}

class _PatientLocationState extends State<PatientLocation> {


  final _mapController = MapController(
    initMapWithUserPosition: const UserTrackingOption(enableTracking: true,unFollowUser: false)
  );

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

    // _initializeMapController();
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
