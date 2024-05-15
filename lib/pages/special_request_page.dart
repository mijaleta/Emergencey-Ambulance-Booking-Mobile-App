import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpecialRequestPage extends StatefulWidget {
  SpecialRequestPage({super.key});

  @override
  _SpecialRequestPageState createState() => _SpecialRequestPageState();
}

class _SpecialRequestPageState extends State<SpecialRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _specialRequest = '';

  Future<void> _submitRequest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var url = Uri.parse(
          'https://ambulance-website.samiintegratedfarm.com/special-requests');

      try {
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'requestText': _specialRequest}),
        );
        if (response.statusCode == 201) {
          _showSuccessDialog();
          _formKey.currentState!.reset();
          _controller.clear();
          setState(() {
            _specialRequest = '';
          });
        } else {
          // Handle server errors
          print('Server error: ${response.body}');
        }
      } catch (e) {
        // Handle network errors
        print('Network error: $e');
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Your request submitted successfully."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Special Requests',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/back7.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Add any special requests or additional information:',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: TextFormField(
                            controller: _controller,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: 'Type here...',
                              filled: true, // Fill the background color
                              fillColor: Colors.white, // Background color
                              hintStyle: TextStyle(
                                  color: Colors.grey), // Hint text color
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _specialRequest = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.length < 10) {
                                return 'Request should be at least 10 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _submitRequest,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
