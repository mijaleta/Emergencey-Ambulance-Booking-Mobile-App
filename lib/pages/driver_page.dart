// import 'package:ambu_app/pages/logout.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'new_driver_page.dart';
import 'package:ambu_app/services/drivers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class DriverPage extends StatefulWidget {
  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  // final locationController = Location();
  // StreamSubscription<LocationData>? locationSubscription;

  static const googlePlex = LatLng(8.952153448511483, 36.98002342434236);
  static const gibeRiver = LatLng(8.823928508371052, 36.92091930301226);

  LatLng? currentPosition;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) async => await fetchLocationUpdates());
  // }

  // @override
  // void dispose() {
  //   locationSubscription?.cancel(); // Cancel the subscription here
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> tab_cats = sortDrivers();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "All drivers",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(
              text: "Available",
            ),
            Tab(
              text: "Working",
            ),
            Tab(text: "Offline"),
          ]),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewDriversCode()),
                    )),
          ],
        ),
        body: TabBarView(
          children: [
            // currentPosition == null
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: googlePlex,
                zoom: 12,
              ),
              markers: {
                // Marker(
                //   markerId: MarkerId('currentLocation'),
                //   icon: BitmapDescriptor.defaultMarker,
                //   position: currentPosition,
                // ),
                const Marker(
                  markerId: MarkerId('sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: googlePlex,
                ),
                const Marker(
                  markerId: MarkerId('destinationLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: gibeRiver,
                ),
              },
              // onLongPress: _addMarker,
            ),
            SingleChildScrollView(
              child: Column(
                children: tab_cats[0],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: tab_cats[2],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: tab_cats[1],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget driverCard(String name, Color col, String status, String regId) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height / 6,
          child: Card(
            color: col,
            child: Column(children: [
              const Row(
                children: [
                  // Image.network(
                  //   "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png")
                ],
              ),
              Text(name),
              Text(regId),
              Text(status)
            ]),
          )),
    );
  }

  List<List<Widget>> sortDrivers() {
    List<List<Widget>> lst = [];

    List<Widget> available = [];
    List<Widget> offline = [];
    List<Widget> working = [];

    for (var e in drivers) {
      if (e['isFree'] && !e['isAvailable']) {
        offline.add(driverCard(e['name'],
            const Color.fromRGBO(235, 233, 228, 1), "Offline", e["reg_id"]));
      } else if (e['isFree']) {
        available.add(driverCard(e['name'],
            const Color.fromRGBO(217, 250, 195, 1), "Available", e["reg_id"]));
      } else if (!e['isFree'] || !e['isAvailable']) {
        working.add(driverCard(e['name'],
            const Color.fromRGBO(250, 152, 152, 1), "Busy", e["reg_id"]));
      }
      lst.add(available);
      lst.add(offline);
      lst.add(working);
    }

    return lst;
  }

  // Future<void> fetchLocationUpdates() async {
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;

  //   serviceEnabled = await locationController.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await locationController.requestService();
  //     if (!serviceEnabled) {
  //       // Handle case where location services are not enabled
  //       return;
  //     }
  //   }

  //   permissionGranted = await locationController.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await locationController.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       // Handle case where location permission is not granted
  //       return;
  //     }
  //   }

  //   // Start listening to location updates
  //   locationSubscription =
  //       locationController.onLocationChanged.listen((currentLocation) {
  //     if (currentLocation.latitude != null &&
  //         currentLocation.longitude != null) {
  //       setState(() {
  //         currentPosition =
  //             LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //       });
  //     }
  //   });
  //   if (currentPosition != null) {
  //     print(currentPosition!);
  //   }
  // }
}
