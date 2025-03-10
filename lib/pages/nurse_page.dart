// import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/new_nurse_page.dart';
import 'package:flutter/material.dart';
import 'new_driver_page.dart';
import 'package:ambu_app/services/drivers.dart';

class NursePage extends StatefulWidget {
  @override
  _NursePageState createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {
  // String? _selectedAvailability;

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> tab_cats = sortDrivers();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Nurses"),
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(
              text: "Available",
            ),
            Tab(text: "Working"),
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
                      MaterialPageRoute(builder: (context) => NewNursesCode()),
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
