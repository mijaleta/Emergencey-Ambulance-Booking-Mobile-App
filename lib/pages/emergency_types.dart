import 'package:ambu_app/pages/special_request_page.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/pages/patient_request_page.dart';

class EmergencyTypeSelectionPage extends StatelessWidget {
  final List<String> diseaseTypes = [
    "Animal Bite",
    "Labor",
    "Car Accident",
    "Heart Attack",
    "Stroke",
    "Severe Bleeding",
    "Choking",
    "Seizure",
    "Allergic Reaction",
    "Poisoning",
    "Burns",
    "Broken Bones",
    "Difficulty Breathing",
    "Fainting or Loss of Consciousness",
    "Overdose",
    "Head Injury",
    "Electrical Shock",
    "Hypothermia or Frostbite",
    "Heatstroke",
    "Sudden Severe Pain",
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
                            child: Text(
                              diseaseTypes[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
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
                            builder: (context) => SpecialRequestPage()),
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
