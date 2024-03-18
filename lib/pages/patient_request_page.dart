import 'package:ambu_app/models/request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ambu_app/provider/request_provider.dart';
import 'package:ambu_app/pages/dispatcher_page.dart';

class PatientRequestPage extends StatefulWidget {
  @override
  _PatientRequestPageState createState() => _PatientRequestPageState();
}

class _PatientRequestPageState extends State<PatientRequestPage> {
  String? emergencyType;
  String? pregnancyStatus;
  String? traumaStatus;
  TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Implement menu icon functionality
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the dispatcher page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DispatcherPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Implement user icon functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Ambulance Request",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton<String>(
                        value: emergencyType,
                        items: ["Disease", "Accident", "Labour"]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              // color: Colors.black,
                              padding: EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            emergencyType = value;
                          });
                        },
                        hint: Text("Select Type",
                            style: TextStyle(color: Colors.white)),
                        isExpanded: true,
                        underline: Container(),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        elevation: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: contactNumberController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Contact Number",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    RoundedDropdownField(
                      "What is the nature of the medical emergency?",
                      (value) {
                        setState(() {
                          pregnancyStatus = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    RoundedDropdownField(
                      "Are you currently pregnant or have you recently given birth?",
                      (value) {
                        setState(() {
                          pregnancyStatus = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    RoundedDropdownField(
                      "Have you recently experienced any trauma or injury?",
                      (value) {
                        setState(() {
                          traumaStatus = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Moved the Submit Request button out of the container
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit request
                    Provider.of<RequestProvider>(context, listen: false)
                        .addRequest(Request(
                      id: DateTime.now()
                          .toString(), // Generating unique ID based on timestamp
                      details: 'Emergency Type: $emergencyType\n'
                          'Contact Number: ${contactNumberController.text}\n'
                          'Pregnancy Status: $pregnancyStatus\n'
                          'Trauma Status: $traumaStatus',
                    ));
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Request Submitted"),
                          content: Text(
                              "Your request has been submitted successfully."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DispatcherPage()));
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.black, width: 2),
                    elevation: 0, // No shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: const Text(
                      "Submit Request",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedDropdownField extends StatelessWidget {
  final String defaultItem;
  final Function(String?) onChanged;

  RoundedDropdownField(this.defaultItem, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        items: ["Answer 1", "Answer 2", "Answer 3"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              // color: Colors.black,
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(defaultItem, style: TextStyle(color: Colors.white)),
        isExpanded: true,
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        elevation: 16,
      ),
    );
  }
}
