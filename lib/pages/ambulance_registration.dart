import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterAmbulance extends StatefulWidget {
  const RegisterAmbulance({Key? key}) : super(key: key);

  @override
  State<RegisterAmbulance> createState() => _RegisterAmbulanceState();
}

class _RegisterAmbulanceState extends State<RegisterAmbulance> {
  bool _isGPSEnabled = false;
  String? selectedAmbulanceType;
  String? selectedSeatingCapacity;
  String? selectedAmbulanceStatus;

  final ambulanceTypesList = [
    'Basic Life Support (BLS)',
    'Advanced Life Support (ALS)',
    'Critical Care Transport (CCT)',
    'Neonatal Intensive Care Unit (NICU) Ambulance',
    'Air Ambulance',
    'Emergency Medical Responder (EMR) Vehicle',
  ];
  final seatingCapacity = [
    '1 (Driver only)',
    '2 (Driver and 1 passenger)',
    '3 (Driver and 2 passengers)',
    '4 (Driver and 3 passengers)',
    '5 (Driver and 4 passengers)',
    '6 (Driver and 5 passengers)',
    '7 (Driver and 6 passengers)',
  ];
  final ambulanceStatus = [
    'In Service',
    'Out of Service',
    'On Standby',
    'Under Maintenance',
    'Under Repair',
    'Dispatched',
    'Returning to Base',
    'Available',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Ambulance Registration',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/pexelsform.jpg"), // Change the path to your image
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'REGISTER AMBULANCE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 113, 102, 13),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Ambulance ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Registration Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // First Dropdown with Comprehensive Overflow Handling
                  Row(
                    children: [
                      Expanded(
                        child: IntrinsicWidth(
                          child: LimitedBox(
                            maxWidth: 300,
                            child: _buildDropdown(
                              'Select Ambulance Type',
                              ambulanceTypesList,
                              selectedAmbulanceType,
                              (String? value) {
                                setState(() {
                                  selectedAmbulanceType = value;
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down, size: 24),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Second Dropdown with Comprehensive Overflow Handling
                  Row(
                    children: [
                      Expanded(
                        child: IntrinsicWidth(
                          child: LimitedBox(
                            maxWidth: 300,
                            child: _buildDropdown(
                              'Seating Capacity',
                              seatingCapacity,
                              selectedSeatingCapacity,
                              (String? value) {
                                setState(() {
                                  selectedSeatingCapacity = value;
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down, size: 24),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'GPS Integration',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Switch(
                        value: _isGPSEnabled,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isGPSEnabled = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Third Dropdown with Comprehensive Overflow Handling
                  Row(
                    children: [
                      Expanded(
                        child: IntrinsicWidth(
                          child: LimitedBox(
                            maxWidth: 300,
                            child: _buildDropdown(
                              'Ambulance Status',
                              ambulanceStatus,
                              selectedAmbulanceStatus,
                              (String? value) {
                                setState(() {
                                  selectedAmbulanceStatus = value;
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down, size: 24),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Attach Document",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ).copyWith(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Browse",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value,
      Function(String?) onChanged,
      {Icon? icon}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      icon: icon,
    );
  }
}
