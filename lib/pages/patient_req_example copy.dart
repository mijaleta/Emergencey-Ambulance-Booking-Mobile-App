import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'LowRecommendationPage.dart';
// import 'MediumRecommendationPage.dart';
// import 'HighRecommendationPage.dart';

class RequestAmbulancePage extends StatefulWidget {
  @override
  _RequestAmbulancePageState createState() => _RequestAmbulancePageState();
}

class _RequestAmbulancePageState extends State<RequestAmbulancePage> {
  final _formKey = GlobalKey<FormState>();
  String _location = '';
  String _contactInfo = '';
  String _urgencyLevel = 'low';

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
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
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
                value: _urgencyLevel,
                decoration: InputDecoration(
                  labelText: 'Urgency Level',
                ),
                items: ['low', 'medium', 'high']
                    .map((level) => DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _urgencyLevel = value as String;
                  });
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
          Uri.parse('http://192.168.0.22:3000/patientRequest'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'location': _location,
            'contactInfo': _contactInfo,
            'urgencyLevel': _urgencyLevel,
          }),
        );
        if (response.statusCode == 200) {
          try {
            final responseData = jsonDecode(response.body);
            if (responseData['message'] ==
                'Booking request submitted successfully') {
              // Show a confirmation dialog or snackbar for mobile clients
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
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.blue, // Button Background Color
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          } catch (e) {
            // If jsonDecode fails, handle the non-JSON response here
            print('The response is not in JSON format: $e');
          }
        } else {
          // Handle the error case
          print('Failed to send request. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (e) {
        // Handle any other types of exceptions that might occur
        print('An error occurred: $e');
      }
    }
  }
}
