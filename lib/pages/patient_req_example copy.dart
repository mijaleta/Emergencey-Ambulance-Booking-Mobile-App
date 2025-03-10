import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart'; // Import the geolocator package
import 'car_page.dart'; // Replace with the actual path to your CarPage file
import 'labour_page.dart'; // Replace with the actual path to your LabourPage file
import 'animal_page.dart'; // Replace with the actual path to your AnimalPage file

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
  String _emergency_type= 'Car';
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
        title: Text('Emergency Ambulance Booking Request'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue:
                    _location, // Set the initial value of the location field
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
                enabled: false, // Disable editing of the location field
              ),


              TextFormField(
                decoration: InputDecoration(
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
              

               
              TextFormField(
                decoration: InputDecoration(
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
              
              
              DropdownButtonFormField(
                value: _emergency_type,
                decoration: InputDecoration(
                  labelText: 'Emergency type',
                ),
                items: ['Car',  'Labour','Animal']
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
              

              // number of incident
              TextFormField(
  decoration: InputDecoration(
    labelText: 'Contact Number',
  ),
  keyboardType: TextInputType.number, // Use number input type for numeric keyboard
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

              ElevatedButton(
                onPressed: _submitRequest,
                child: Text('Submit Request'),
              ),
            ],
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
        Uri.parse('http://192.168.185.172:3000/patientRequest'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'location': _location,
          'contactInfo': _contactInfo,
          'emergency_type': _emergency_type,
          'address': _address,
          'number':_number
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
                      _navigateToEmergencyPage(context); // Navigate to the emergency page
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => CarPage()));
      break;
    case 'Labour':
      Navigator.push(context, MaterialPageRoute(builder: (context) => LabourPage()));
      break;
    case 'Animal':
      Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalPage()));
      break;
    default:
      // Handle unknown emergency type if necessary
      break;
  }
}


}








class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Emergency'),
      ),
      body: Center(
        child: Text('Details about Car Emergency'),
      ),
    );
  }
}

class LabourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labour Emergency'),
      ),
      body: Center(
        child: Text('Details about Labour Emergency'),
      ),
    );
  }
}

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Emergency'),
      ),
      body: Center(
        child: Text('Details about Animal Emergency'),
      ),
    );
  }
}