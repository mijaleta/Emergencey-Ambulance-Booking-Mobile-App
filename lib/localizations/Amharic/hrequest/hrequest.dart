import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import '../../../pages/animal_page.dart';
import '../../../pages/car_page.dart';
import '../../../pages/labour_page.dart'; // Import the geolocator package

class HRequestAmbulancePage extends StatefulWidget {
  @override
  _HRequestAmbulancePageState createState() => _HRequestAmbulancePageState();
}

class _HRequestAmbulancePageState extends State<HRequestAmbulancePage> {
  final _formKey = GlobalKey<FormState>();
  String _location = ''; // Initialize location variable
  String _contactInfo = '';
  String _address = '';
  String _number = '';
  String _emergency_type = 'Car';
  String _patient_condition = '';
  late Position _currentPosition; // Variable to store current position

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Call the function to get the user's location when the page is initialized
  }

  // Function to get the user's current location
  void _getCurrentLocation() async {
    try {
      Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        _currentPosition = newPosition;
        _location =
        '${_currentPosition.latitude},${_currentPosition.longitude}';
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('የአደጋ አምቡላንስ ጥያቄ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Padding(

            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('አሁን ያዝ!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 24),),
                Text('ፈጣን አገልግሎቶችን ያግኙ!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent, fontSize: 24),),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue:
                  _location, // Set the initial value of the location field
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'አካባቢ',
                  ),
                  enabled: false, // Disable editing of the location field
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'አድራሻ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'እባክዎ የአድራሻዎን መረጃ ያስገቡ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'የታካሚ ሁኔታ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'የታካሚውን ሁኔታ እዚህ ይሙሉ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient_condition = value!;
                  },
                ),
                SizedBox(height: 20,),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'የመገኛ አድራሻ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'እባክዎ የመገኛ አድራሻዎን ያስገቡ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _contactInfo = value!;
                  },
                ),
                SizedBox(height: 20,),

                DropdownButtonFormField(
                  value: _emergency_type,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'የአደጋ አይነት',
                  ),
                  items: ['Car', 'Labour', 'Animal']
                      .map((level) => DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _emergency_type = value as String;
                    });
                  },
                ),
                SizedBox(height: 20,),

                // number of incident
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'የተሳፋሪ (ታካሚ) ቁጥር',
                  ),
                  keyboardType: TextInputType
                      .number, // Use number input type for numeric keyboard
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'የታካሚ ቁጥር';
                    }
                    // Add a condition to check if the entered value is a valid number
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'እባክዎ ትክክለኛ ቁጥር ያስገቡ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _number = value!;
                  },
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: _submitRequest,
                    child: Text('ጥያቄ አስገባ', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitRequest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var response = await http.post(
          // Uri.parse('http://192.168.0.49:3000/patientRequest'),
          Uri.parse(
              'https://ambulance-website.samiintegratedfarm.com/patientRequest'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'location': _location,
            'contactInfo': _contactInfo,
            'emergency_type': _emergency_type,
            'address': _address,
            'number': _number,
            'patient_condition': _patient_condition
          }),
        );
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          if (responseData['message'] ==
              'Booking request submitted successfully') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('ተሳክቶአል'),
                  content: Text(responseData['መልእክት']),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        _navigateToEmergencyPage(
                            context); // Navigate to the emergency page
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          print('ጥያቄ መላክ አልተሳካም። የሁኔታ ኮድ: ${response.statusCode}');
          print('ምላሽ አካል: ${response.body}');
        }
      } catch (e) {
        print('ስህተት ተፈጥሯል: $e');
      }
    }
  }

  void _navigateToEmergencyPage(BuildContext context) {
    switch (_emergency_type) {
      // የ መኪና አደጋ', 'ምጥ', 'የእንስሳት ንክሻ
      // 'Car', 'Labour', 'Animal'
      case 'Car':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CarPage()));
        break;
      case 'ምጥ':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LabourPage()));
        break;
      case 'Animal':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AnimalPage()));
        break;
      default:
      // Handle unknown emergency type if necessary
        break;
    }
  }
}