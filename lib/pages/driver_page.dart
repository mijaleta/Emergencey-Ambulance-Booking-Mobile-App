// import 'package:ambu_app/pages/logout.dart';
import 'package:flutter/material.dart';
import 'new_driver_page.dart';
import 'package:ambu_app/services/drivers.dart';

class DriverPage extends StatefulWidget {
  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  // String? _selectedAvailability;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Driver Page'),
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Availability Status',
  //             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 10.0),
  //           DropdownButton<String>(
  //             value: _selectedAvailability,
  //             onChanged: (String? newValue) {
  //               setState(() {
  //                 _selectedAvailability = newValue;
  //               });
  //             },
  //             items: <String?>['Available', 'Busy', 'Offline']
  //                 .map<DropdownMenuItem<String>>((String? value) {
  //               return DropdownMenuItem<String>(
  //                 value: value,
  //                 child: Text(value ?? ''),
  //               );
  //             }).toList(),
  //           ),
  //           SizedBox(height: 20.0),
  //           Text(
  //             'Booking Requests',
  //             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 10.0),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: 5,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return ListTile(
  //                   title: Text('Booking $index'),
  //                   subtitle: Text(
  //                       'Pickup: Location $index - Destination: Location ${index + 1}'),
  //                   trailing: ElevatedButton(
  //                     onPressed: () {
  //                       // Handle accepting booking
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                         backgroundColor: Colors.green),
  //                     child: const Text(
  //                       'Accept',
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //           const SizedBox(height: 20.0),
  //           const Text(
  //             'Booking History',
  //             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 10.0),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: 5,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return ListTile(
  //                   title: Text('Booking $index'),
  //                   subtitle: Text(
  //                       'Date: ${DateTime.now().subtract(Duration(days: index)).toString()}'),
  //                   onTap: () {
  //                     // Handle tapping on history item
  //                   },
  //                 );
  //               },
  //             ),
  //           ),
  //           const SizedBox(height: 20.0),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Handle logout action
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => Logout()),
  //               );
  //             },
  //             child: Text('Logout'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> tab_cats = sortDrivers();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "All drivers",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          bottom: TabBar(tabs: [
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
                icon: Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewDriversCode()),
                    )),
          ],
        ),
        body: TabBarView(children: [
          Column(),
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
        ]),
      ),
    );
  }

  Widget driverCard(String name, Color col, String status, String regId) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height / 6,
          child: Card(
            child: Column(children: [
              Row(
                children: [
                  // Image.network(
                  //   "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png")
                ],
              ),
              Text(name),
              Text(regId),
              Text(status)
            ]),
            color: col,
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
        offline.add(driverCard(e['name'], Color.fromRGBO(235, 233, 228, 1),
            "Offline", e["reg_id"]));
      } else if (e['isFree']) {
        available.add(driverCard(e['name'], Color.fromRGBO(217, 250, 195, 1),
            "Available", e["reg_id"]));
      } else if (!e['isFree'] || !e['isAvailable']) {
        working.add(driverCard(
            e['name'], Color.fromRGBO(250, 152, 152, 1), "Busy", e["reg_id"]));
      }
      lst.add(available);
      lst.add(offline);
      lst.add(working);
    }

    return lst;
  }
}
