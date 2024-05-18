import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'animal_page.dart';
import 'car_page.dart';
import 'labour_page.dart'; // Import the geolocator package

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
  String? _emergencyType;
  String _patientCondition = '';
  String _patientName = '';
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
    return Visibility(
      visible: _emergencyType != null && _emergencyType!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_emergencyType == 'Car') CarQuestions(),
          if (_emergencyType == 'Labour') LabourQuestions(),
          if (_emergencyType == 'Animal') AnimalQuestions(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showIncompleteFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incomplete Form'),
          content: Text('Please answer all the questions to submit the request.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void _submitRequest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_emergencyType == 'Car' && _address.isEmpty) {
        _showIncompleteFormDialog(context);
        return;
      }
      if (_emergencyType == 'Labour' && _address.isEmpty) {
        _showIncompleteFormDialog(context);
        return;
      }
      if (_emergencyType == 'Animal' && (_address.isEmpty || _patientCondition.isEmpty)) {
        _showIncompleteFormDialog(context);
        return;
      }


      try {
        var response = await http.post(
          Uri.parse('https://ambulance-website.samiintegratedfarm.com/patientRequest'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'location': _location,
            'contactInfo': _contactInfo,
            'emergency_type': _emergencyType ?? '', // Provide default value if _emergencyType is null
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

  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your contact information';
    }
    final pattern = r'^(?:\+2519|\+2517|09|07)\d{8}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid contact number starting with +2519, +2517, 09, or 07';
    }
    return null;
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
                    labelText: 'Patient Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter patient Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patientName = value!;
                  },
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
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d+]')),
                  ],
                  validator: _validateContact,
                  onSaved: (value) {
                    _contactInfo = value!;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _emergencyType,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Emergency type',
                  ),
                  items: [
                    'Select Emergency Type', // Add a "Select Emergency Type" item
                    'Car',
                    'Labour',
                    'Animal'
                  ].map((level) => DropdownMenuItem(
                    value: level == 'Select Emergency Type' ? null : level, // Set value to null for "Select Emergency Type"
                    child: Text(level),
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _emergencyType = value; // No need for a cast as the type is already String?
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
                      labelText: 'Patient Number',
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

// Define the mixin
mixin IncompleteDialogMixin<T extends StatefulWidget> on State<T> {
  List<String> incompleteQuestions = [];

  void _showIncompleteDialog(BuildContext context) {
    if (incompleteQuestions.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete Form'),
            content: Text('Please answer all questions before submitting.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

// Other methods and widgets...
}

class CarQuestions extends StatefulWidget {
  @override
  _CarQuestionsState createState() => _CarQuestionsState();
}

class _CarQuestionsState extends State<CarQuestions> with IncompleteDialogMixin<CarQuestions> {
  String? _conscious;
  String? _breathing;
  String? _injuries;
  String? _bleeding;
  String? _pulse;
  String _priority = '';

  void _determinePriority() {
    // Check if all questions are answered
    if (_conscious == null ||
        _breathing == null ||
        _injuries == null ||
        _bleeding == null ||
        _pulse == null) {
      // Store incomplete questions
      incompleteQuestions = ['conscious', 'breathing', 'injuries', 'bleeding', 'pulse'];
      return; // Do not update priority if any question is unanswered
    }

    String priority = 'Low';
    // Is the patient conscious?
    // Is the patient breathing?
    // Are there any severe injuries?
    // Is there any visible bleeding?
    // What is the patient’s pulse rate?

    if ((_conscious == 'no' && _breathing == 'no' && _pulse == 'none' && _bleeding == 'severe' && _injuries == 'yes') ||
        (_conscious == 'no' && _breathing == 'no' && _pulse == 'none' && _bleeding == 'moderate' && _injuries == 'no') ||
        (_conscious == 'yes' && _breathing == 'no' && _pulse == 'none' && _bleeding == 'moderate' && _injuries == 'yes')) {
      priority = 'High';
    } else if ((_bleeding == 'severe' && _conscious == 'yes' && _injuries == 'yes') || (_bleeding == 'moderate' && _conscious == 'yes' && _injuries == 'no') ||
        (_bleeding == 'moderate' && _conscious == 'yes' && _pulse == 'none' && _injuries == 'yes')) {
      priority = 'Medium';
    } else {
      priority = 'Low';
    }
    // // Clear incomplete questions list
    //     incompleteQuestions.clear();

    setState(() {
      _priority = priority; // Update _priority
    });
  }

  Widget _buildRadioQuestion(String question, String? value, Function(String?) onChanged) {
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
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority(); // Calculate priority when any radio button changes
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority(); // Calculate priority when any radio button changes
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRadioQuestionMultipleOptions(String question, String? value, List<String> options, Function(String?) onChanged) {
    return Column(
      children: [
        Text(question),
        Column(
          children: options.map((option) {
            return RadioListTile(
              title: Text(option),
              value: option.toLowerCase(),
              groupValue: value,
              onChanged: (newValue) {
                onChanged(newValue);
                _determinePriority(); // Calculate priority when any radio button changes
              },
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
              (value) => setState(() => _conscious = value),
        ),
        _buildRadioQuestion(
          'Is the patient breathing?',
          _breathing,
              (value) => setState(() => _breathing = value),
        ),
        _buildRadioQuestion(
          // Are there any severe injuries?
          // Is there any visible bleeding?
          // What is the patient’s pulse rate?
          'Are there any severe injuries?',
          _injuries,
              (value) => setState(() => _injuries = value),
        ),
        _buildRadioQuestionMultipleOptions(
          'Is there any visible bleeding?',
          _bleeding,
          ['Severe', 'Moderate', 'None'],
              (value) => setState(() => _bleeding = value),
        ),
        _buildRadioQuestionMultipleOptions(
          'What is the patient’s pulse rate?',
          _pulse,
          ['Normal', 'Fast', 'Slow', 'None'],
              (value) => setState(() => _pulse = value),
        ),
        SizedBox(height: 20),
        TextFormField(
          readOnly: true, // Make it read-only
          controller: TextEditingController(text: _priority), // Use controller to set the text
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

class _LabourQuestionsState extends State<LabourQuestions> with IncompleteDialogMixin<LabourQuestions> {
  String? _complications;
  String? _medicalConditions;
  String? _unusualSymptoms;
  String? _otherSymptoms;
  String? _vaginalBleeding;
  String? _painIntensity;
  String _priority = '';

  void _determinePriority() {
    // Check if all questions are answered
    if (_complications == null ||
        _medicalConditions == null ||
        _unusualSymptoms == null ||
        _otherSymptoms == null ||
        _vaginalBleeding == null ||
        _painIntensity == null) {
      // Show incomplete dialog if any question is unanswered
      _showIncompleteDialog(context);
      return;
    }

    String priority = 'Low';

    if ((_complications == 'yes' && _unusualSymptoms == 'yes') ||
        (_complications == 'yes' && _vaginalBleeding == 'yes') ||
        (_vaginalBleeding == 'yes' && _painIntensity == '9') ||
        (_vaginalBleeding == 'yes' && _otherSymptoms == 'yes')) {
      priority = 'High';
    } else if ((_complications == 'yes' && _vaginalBleeding == 'no') ||
        (_medicalConditions == 'yes' && _vaginalBleeding == 'no') ||
        (_unusualSymptoms == 'yes' && _vaginalBleeding == 'no') ||
        (_otherSymptoms == 'yes' && _vaginalBleeding == 'no') ||
        (_vaginalBleeding == 'yes' && _painIntensity != '9')) {
      priority = 'Medium';
    } else {
      priority = 'Low';
    }

    setState(() {
      _priority = priority;
    });
  }

  Widget _buildRadioQuestion(
      String question, String? value, Function(String?) onChanged) {
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
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority();
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority();
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSliderQuestion(
      String question, String? value, Function(double) onChanged) {
    return Column(
      children: [
        Text(question),
        Slider(
          value: double.tryParse(value ?? '0') ?? 0,
          min: 0,
          max: 10,
          divisions: 10,
          label: value,
          onChanged: (newValue) {
            onChanged(newValue);
            _determinePriority();
          },
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
          'Have you experienced any complications during this pregnancy?',
          _complications,
              (value) => setState(() => _complications = value),
        ),
        _buildRadioQuestion(
          'Do you have any medical conditions or allergies?',
          _medicalConditions,
              (value) => setState(() => _medicalConditions = value),
        ),
        _buildRadioQuestion(
          'Have you experienced any unusual symptoms during this pregnancy?',
          _unusualSymptoms,
              (value) => setState(() => _unusualSymptoms = value),
        ),
        _buildRadioQuestion(
          'Are you experiencing any other symptoms such as dizziness, nausea, or headache?',
          _otherSymptoms,
              (value) => setState(() => _otherSymptoms = value),
        ),
        _buildRadioQuestion(
          'Are you experiencing any vaginal bleeding?',
          _vaginalBleeding,
              (value) => setState(() => _vaginalBleeding = value),
        ),
        _buildSliderQuestion(
          'How intense is your pain on a scale from 1 to 10?',
          _painIntensity,
              (value) => setState(() => _painIntensity = value.toString()),
        ),
        SizedBox(height: 20),
        TextFormField(
          readOnly: true,
          controller: TextEditingController(text: _priority),
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

class _AnimalQuestionsState extends State<AnimalQuestions> with IncompleteDialogMixin<AnimalQuestions> {
  String? _q1;
  String? _q2;
  String? _q3;
  String? _q4;
  String _priority = 'Medium';

  void _determinePriority() {
    // Check if all questions are answered
    if (_q1 == null ||
        _q2 == null ||
        _q3 == null ||
        _q4 == null) {
      // Show incomplete dialog if any question is unanswered
      _showIncompleteDialog(context);
      return; // Do not update priority if any question is unanswered
    }

    String priority = 'Low';

    if (_q2 == 'yes' && _q3 == 'yes' && (_q1 != 'dog' || _q1 != 'cat')) {
      priority = 'High';
    } else if (_q4 == 'no') {
      priority = 'Medium';
    } else {
      priority = 'Low';
    }

    setState(() {
      _priority = priority; // Update _priority
    });
  }

  Widget _buildRadioQuestion(String question, String? value, Function(String?) onChanged) {
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
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority(); // Calculate priority when any radio button changes
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('No'),
                value: 'no',
                groupValue: value,
                onChanged: (newValue) {
                  onChanged(newValue);
                  _determinePriority(); // Calculate priority when any radio button changes
                },
              ),
            ),
          ],
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
          'What type of animal caused the injury?',
          _q1,
              (value) => setState(() => _q1 = value),
        ),
        _buildRadioQuestion(
          'Are there any deep wounds or severe bleeding?',
          _q2,
              (value) => setState(() => _q2 = value),
        ),
        _buildRadioQuestion(
          'Are there any signs of infection at the injury site (e.g., swelling, redness)?',
          _q3,
              (value) => setState(() => _q3 = value),
        ),
        _buildRadioQuestion(
          'Do you know if the animal was vaccinated against rabies?',
          _q4,
              (value) => setState(() => _q4 = value),
        ),
        SizedBox(height: 20),
        TextFormField(
          readOnly: true, // Make it read-only
          controller: TextEditingController(text: _priority), // Use controller to set the text
          decoration: InputDecoration(
            labelText: 'Priority', // Label for the text field
            border: OutlineInputBorder(), // Border decoration
          ),
        ),
      ],
    );
  }
}
