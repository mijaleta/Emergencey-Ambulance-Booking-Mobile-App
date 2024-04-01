import 'package:flutter/material.dart';
import 'package:ambu_app/pages/special_request_page.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/patient_req_example.dart';

class EmergencyTypeSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> diseaseTypes = [
    {"name": "Animal Bite", "icon": Icons.pets},
    {"name": "Labor", "icon": Icons.accessibility_new},
    {"name": "Car Accident", "icon": Icons.directions_car},
    {"name": "Heart Attack", "icon": Icons.favorite},
    {"name": "Stroke", "icon": Icons.healing},
    {"name": "Severe Bleeding", "icon": Icons.healing},
    {"name": "Choking", "icon": Icons.priority_high},
    {"name": "Seizure", "icon": Icons.warning},
    {"name": "Allergic Reaction", "icon": Icons.healing},
    {"name": "Poisoning", "icon": Icons.dangerous},
    {"name": "Burns", "icon": Icons.local_fire_department},
    {"name": "Broken Bones", "icon": Icons.masks},
    {"name": "Difficulty Breathing", "icon": Icons.airline_seat_flat},
    {
      "name": "Fainting or Loss of Consciousness",
      "icon": Icons.airline_seat_individual_suite
    },
    {"name": "Overdose", "icon": Icons.warning_amber_outlined},
    {"name": "Head Injury", "icon": Icons.fact_check_outlined},
    {"name": "Electrical Shock", "icon": Icons.flash_on_outlined},
    {"name": "Hypothermia or Frostbite", "icon": Icons.ac_unit_outlined},
    {"name": "Heatstroke", "icon": Icons.whatshot_outlined},
    {"name": "Sudden Severe Pain", "icon": Icons.warning_amber_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Select Emergency Type",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/back5.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.transparent,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: diseaseTypes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Handle the selected emergency type here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientRequestPage(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  diseaseTypes[index]['icon'],
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  diseaseTypes[index]['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientRequestPage(),
                      );
                    },
                    child: Text("Special Requests"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
