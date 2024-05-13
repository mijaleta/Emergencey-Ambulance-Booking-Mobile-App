import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HSpecialRequestPage extends StatefulWidget {
  HSpecialRequestPage({super.key});

  @override
  _HSpecialRequestPageState createState() => _HSpecialRequestPageState();
}

class _HSpecialRequestPageState extends State<HSpecialRequestPage> {
  String _specialRequest = '';

  // ... (other code)

  Future<void> _submitRequest() async {
    // var url =  Uri.parse('http://192.168.0.65:3000/special-requests');
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
      } else {
        // Handle server errors
        print('የአገልጋይ ስህተት: ${response.body}');
      }
    } catch (e) {
      // Handle network errors
      print('የአውታረ መረብ ስህተት: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("ጥያቄዎ በተሳካ ሁኔታ ገብቷል።"),
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'ልዩ ጥያቄዎች',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'ማንኛውንም ልዩ ጥያቄዎች ወይም ተጨማሪ መረጃ ያክሉ',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextFormField(
                          maxLines: 10,
                          decoration: const InputDecoration(
                            hintText: 'እዚህ ጻፍ...',
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
                                'ጥያቄዎን ያስገቡ',
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
          ],
        ),
      ),
    );
  }
}
