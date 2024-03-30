import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpecialRequestPage extends StatefulWidget {
  SpecialRequestPage({super.key});

  @override
  _SpecialRequestPageState createState() => _SpecialRequestPageState();
}

class _SpecialRequestPageState extends State<SpecialRequestPage> {
  String _specialRequest = '';

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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
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
                        TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Type here...',
                            filled: true, // Fill the background color
                            fillColor: Colors.white, // Background color
                            hintStyle: TextStyle(
                                color: Colors.grey), // Hint text color
                            // border: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              _specialRequest = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle saving the special request
                                  Navigator.pop(context, _specialRequest);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  'Save',
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
