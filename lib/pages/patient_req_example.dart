import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart'; // Import the geolocator package
import 'car_page.dart';
import 'labour_page.dart';
import 'animal_page.dart';

class RequestAmbulancePage extends StatefulWidget {
  @override
  _RequestAmbulancePageState createState() => _RequestAmbulancePageState();
}

class _RequestAmbulancePageState extends State<RequestAmbulancePage> {
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
        title: Text('Emergency Ambulance Booking Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Padding(

            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('Book Now!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 24),),
                Text('Get quick services!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent, fontSize: 24),),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue:
                      _location, // Set the initial value of the location field
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'Location',
                  ),
                  enabled: false, // Disable editing of the location field
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address information';
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
                    labelText: 'Patient condition',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'patient condition here';
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
                    labelText: 'Contact Information',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your contact information';
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
                    labelText: 'Emergency type',
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
                    labelText: 'Contact Number',
                  ),
                  keyboardType: TextInputType
                      .number, // Use number input type for numeric keyboard
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'patient number';
                    }
                    // Add a condition to check if the entered value is a valid number
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid number';
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
                    child: Text('Submit Request', style: TextStyle(color: Colors.white),),
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
                  title: Text('Success'),
                  content: Text(responseData['message']),
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
          print('Failed to send request. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    }
  }

  void _navigateToEmergencyPage(BuildContext context) {
    switch (_emergency_type) {
      case 'Car':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CarPage()));
        break;
      case 'Labour':
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