import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'animal_page.dart';
import 'car_page.dart';
import 'labour_page.dart'; // Import the geolocator package
// import 'car_page.dart';
// import 'labour_page.dart';
// import 'animal_page.dart';

class RequestAmbulancePage extends StatefulWidget {
  @override
  _RequestAmbulancePageState createState() => _RequestAmbulancePageState();
}

class _RequestAmbulancePageState extends State<RequestAmbulancePage> {
  final _formKey = GlobalKey<FormState>();
  String _location = '';
  String _contactInfo = '';
  String _address = '';
  String _number = '';
  String _emergencyType = 'Car';
  String _patientCondition = '';
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        _currentPosition = newPosition;
        _location = '${_currentPosition.latitude},${_currentPosition.longitude}';
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Widget _getEmergencyQuestionsWidget() {
    switch (_emergencyType) {
      case 'Car':
        return CarQuestions();
      case 'Labour':
        return LabourQuestions();
      case 'Animal':
        return AnimalQuestions();
      default:
        return Container();
    }
  }

  void _submitRequest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var response = await http.post(
          Uri.parse('https://ambulance-website.samiintegratedfarm.com/patientRequest'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'location': _location,
            'contactInfo': _contactInfo,
            'emergency_type': _emergencyType,
            'address': _address,
            'number': _number,
            'patient_condition': _patientCondition,
          }),
        );
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          if (responseData['message'] == 'Booking request submitted successfully') {
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
                        Navigator.of(context).pop();
                        _navigateToEmergencyPage(context);
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
    switch (_emergencyType) {
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
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Emergency Ambulance Booking Request',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Book Now!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 24),
                ),
                Text(
                  'Get quick services!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 24),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: false,
                  child: TextFormField(
                    initialValue: _location,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Location',
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Patient condition',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter patient condition';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patientCondition = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                SizedBox(height: 20),
                DropdownButtonFormField(
                  value: _emergencyType,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                      _emergencyType = value as String;
                    });
                  },
                ),
                SizedBox(height: 20),
                _getEmergencyQuestionsWidget(),
                SizedBox(height: 20),
                if (_emergencyType != 'Labour')
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Passenger(Patient) Number',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter patient number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _number = value!;
                    },
                  ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: _submitRequest,
                    child: Text(
                      'Submit Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarQuestions extends StatefulWidget {
  @override
  _CarQuestionsState createState() => _CarQuestionsState();
}

class _CarQuestionsState extends State<CarQuestions> {
  String _conscious = 'yes';
  String _breathing = 'yes';
  String _airway = 'yes';
  String _bleeding = 'none';
  String _pulse = 'normal';
  String _injury = 'no';
  String _visibleInjuries = 'no';
  String _ejected = 'no';
  String _pain = 'no';
  String _priority = ''; // Define _priority here

  @override
  void initState() {
    super.initState();
    _determinePriority();
  }

  void _determinePriority() {
    String priority = 'low';

    if (_conscious == 'no' && _breathing == 'no' && _pulse == 'none') {
      priority = 'high';
    } else if (_bleeding == 'severe' ||
        _injury == 'yes' ||
        _ejected == 'yes' ||
        _pain == 'yes') {
      priority = 'medium';
    } else if (_airway == 'no' ||
        _bleeding == 'moderate' ||
        _pulse == 'fast' ||
        _pulse == 'slow' ||
        _visibleInjuries == 'yes') {
      priority = 'low';
    }

    setState(() {
      _priority = priority; // Update _priority
    });
  }

  Widget _buildRadioQuestion(
      String question, String value, Function(String?) onChanged) {
    return Column(
      children: [
        Text(question),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text('Yes'),
                value: 'yes',
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRadioQuestionMultipleOptions(String question, String value,
      List<String> options, Function(String?) onChanged) {
    return Column(
      children: [
        Text(question),
        Column(
          children: options.map((option) {
            return RadioListTile(
              title: Text(option),
              value: option.toLowerCase(),
              groupValue: value,
              onChanged: onChanged,
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      _buildRadioQuestion(
      'Is the patient conscious?',
      _conscious,
            (value) {
          setState(() {
            _conscious = value!;
            _determinePriority(); // Calculate priority when any radio button changes
          });
        },
      ),
        _buildRadioQuestion(
          'Is the patient breathing?',
          _breathing,
              (value) {
            setState(() {
              _breathing = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestion(
          'Is the airway clear?',
          _airway,
              (value) {
            setState(() {
              _airway = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestionMultipleOptions(
          'Is there any visible bleeding?',
          _bleeding,
          ['Severe', 'Moderate', 'None'],
              (value) {
            setState(() {
              _bleeding = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestionMultipleOptions(
          'What is the patient’s pulse rate?',
          _pulse,
          ['Normal', 'Fast', 'Slow', 'None'],
              (value) {
            setState(() {
              _pulse = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestion(
          'Is there any head, neck, or spinal injury?',
          _injury,
              (value) {
            setState(() {
              _injury = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestion(
          'Are there any visible injuries or deformities?',
          _visibleInjuries,
              (value) {
            setState(() {
              _visibleInjuries = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestion(
          'Was the patient ejected from the vehicle?',
          _ejected,
              (value) {
            setState(() {
              _ejected = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
        _buildRadioQuestion(
          'Is the patient experiencing severe pain?',
          _pain,
              (value) {
            setState(() {
              _pain = value!;
              _determinePriority(); // Calculate priority when any radio button changes
            });
          },
        ),
    SizedBox(height: 20),
        TextFormField(
          readOnly: true, // Make it read-only
          initialValue: _priority, // Set initial value to the determined priority
          decoration: InputDecoration(
            labelText: 'Priority', // Label for the text field
            border: OutlineInputBorder(), // Border decoration
          ),
        ),
      ],
    );
  }
}


class LabourQuestions extends StatefulWidget {
  @override
  _LabourQuestionsState createState() => _LabourQuestionsState();
}

class _LabourQuestionsState extends State<LabourQuestions> {
  String _q1 = ''; // How far apart are contractions (minutes)
  String _q2 = ''; // Has water broken?
  String _q3 = ''; // Vaginal bleeding?
  String _q4 = ''; // Feeling baby move?
  String _priority = ''; // Define _priority here

  void _determinePriority() {
    String priority = 'low';

    if (_q1 == 'less than 5' || _q2 == 'yes' || _q3 == 'heavy') {
      priority = 'high';
    } else if (_q1 == '5-10' || _q3 == 'moderate') {
      priority = 'medium';
    } else if (_q4 == 'no') {
      priority = 'urgent';
    }

    setState(() {
      _priority = priority;
    });
  }

  Widget _buildRadioQuestion(String question, String value, Function(String?) onChanged) {
    return Column(
      children: [
        Text(question),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text('Yes'),
                value: 'yes',
                groupValue: value,
                onChanged: (value) => setState(() => _q1 = value!),
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: (value) => setState(() => _q1 = value!),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _determinePriority(); // Call initially to set priority
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRadioQuestion(
          'How far apart are your contractions (in minutes)?',
          _q1,
              (value) => setState(() {
                {
                _q1 = value!;
              _determinePriority();
              };
              }),
        ),
        _buildRadioQuestion(
          'Has your water broken?',
          _q2,
              (value) => setState((){
                _q2 = value!;
              _determinePriority();
              }),
        ),
        _buildRadioQuestion(
          'Are you experiencing any vaginal bleeding?',
          _q3,
              (value) => setState(() {
                {
                _q3 = value!;
              _determinePriority();
              };
              }),
        ),
        _buildRadioQuestion(
          'Are you still feeling the baby move?',
          _q4,
              (value) => setState(() {
                _q4 = value!;
              _determinePriority();
              }),
        ),
        SizedBox(height: 20),
        TextFormField(
          readOnly: true,
          initialValue: _priority,
          decoration: InputDecoration(
            labelText: 'Priority',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class AnimalQuestions extends StatefulWidget {
  @override
  _AnimalQuestionsState createState() => _AnimalQuestionsState();
}

class _AnimalQuestionsState extends State<AnimalQuestions> {
  String _q1 = 'no'; // Type of animal
  String _q2 = 'no'; // Deep wounds or bleeding?
  String _q3 = 'no'; // Signs of infection?
  String _q4 = 'no'; // Rabies vaccination?
  String _priority = ''; // Define _priority here

  void _determinePriority() {
    String priority = 'low';

    if (_q2 == 'yes' || (_q3 == 'yes' && _q1 != 'cat' && _q1 != 'dog')) {
      priority = 'high';
    } else if (_q3 == 'yes' || _q1 == 'wild animal') {
      priority = 'medium';
    }

    setState(() {
      _priority = priority;
    });
  }

  Widget _buildRadioQuestion(String question, String value, Function(String?) onChanged) {
    return Column(
      children: [
        Text(question),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text('Yes'),
                value: 'yes',
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _determinePriority(); // Call initially to set priority
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRadioQuestion(
          'What type of animal caused the injury?',
          _q1,
              (value) => setState(() {
                _q1 = value!;
              _determinePriority();
              }),
        ),
        _buildRadioQuestion(
          'Are there any deep wounds or severe bleeding?',
          _q2,
              (value) => setState(() {
                _q2 = value!;
              _determinePriority();
              }),
        ),
        _buildRadioQuestion(
          'Are there any signs of infection at the injury site (e.g., swelling, redness)?',
          _q3,
              (value) => setState(() {
                _q2 = value!;
              _determinePriority();
              }),
        ),
        _buildRadioQuestion(
          'Do you know if the animal was vaccinated against rabies?',
          _q4,
              (value) => setState(() {
                _q4 = value!;
              _determinePriority();
              }),
        ),
        SizedBox(height: 20),
        TextFormField(
          readOnly: true,
          initialValue: _priority,
          decoration: InputDecoration(
            labelText: 'Priority',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
