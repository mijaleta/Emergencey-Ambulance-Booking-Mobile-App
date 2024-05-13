import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import '../../../pages/animal_page.dart';
import '../../../pages/car_page.dart';
import '../../../pages/labour_page.dart'; // Import the geolocator package

class ORequestAmbulancePage extends StatefulWidget {
  @override
  _ORequestAmbulancePageState createState() => _ORequestAmbulancePageState();
}

class _ORequestAmbulancePageState extends State<ORequestAmbulancePage> {
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
      print('Location kee argachuu hin dandeenye: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Ambulaansii Balaa tasaa Gaafachuu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Padding(

            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('Amma Gaafadhu!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 24),),
                Text('Tajaajila hatattamaa!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent, fontSize: 24),),
                SizedBox(height: 20,),
                // TextFormField(
                //   initialValue:
                //   _location, // Set the initial value of the location field
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                //     ),
                //     labelText: 'Location',
                //   ),
                //   enabled: false, // Disable editing of the location field
                // ),
                SizedBox(height: 20,),
                Visibility(
                  visible: false,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                      ),
                      labelText: 'Bakka amma jirtu galchi',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Odeeffannoo Bakka itti argamtuu guuti';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    labelText: 'Haala dhukkubsataan irra jiru galchi',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Haala dhukkubasataa galchi';
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
                    labelText: 'Lakkoofsa bilbilaa galchi',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Bilbilakee galchi';
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
                    labelText: 'Gosa balaa Tasaa',
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
                    labelText: 'Baay\'\ina Dukkubsattootaa' ,
                  ),
                  keyboardType: TextInputType
                      .number, // Use number input type for numeric keyboard
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Baay\'\ina galchi';
                    }
                    // Add a condition to check if the entered value is a valid number
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Lakkofsa Sirrii Galchi';
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
                    child: Text('Ergi', style: TextStyle(color: Colors.white),),
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
                  title: Text('Milkaa\'eera'),
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
          print('Gaaffiinkee hin ergamne. Koodii Haalaa: ${response.statusCode}');
          print('Qaama deebii: ${response.body}');
        }
      } catch (e) {
        print('Dogoggorri Uumameera: $e');
      }
    }
  }

  void _navigateToEmergencyPage(BuildContext context) {
    switch (_emergency_type) {
      // Balaa Konkolaataa', 'Ciniinsuu', 'Hiddaa Beeyiladaa
      // 'Car', 'Labour', 'Animal'
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