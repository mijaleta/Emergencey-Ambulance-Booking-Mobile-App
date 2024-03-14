import 'package:ambu_app/pages/dispatcher_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ambu_app/provider/request_provider.dart';

class PatientRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                        items: ["Disease", "Accident", "Labour"]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              color: Colors.black,
                              padding: EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // Handle dropdown value change
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
                    // Rounded dropdown fields with default items
                    RoundedDropdownField(
                        "What is the nature of the medical emergency?"),
                    SizedBox(height: 16),
                    RoundedDropdownField(
                        "Are you currently pregnant or have you recently given birth?"),
                    SizedBox(height: 16),
                    RoundedDropdownField(
                        "Have you recently experienced any trauma or injury?"),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Submit request
                          Provider.of<RequestProvider>(context, listen: false)
                              .addRequest();
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
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: const Text(
                            "Submit Request",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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

  RoundedDropdownField(this.defaultItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        items: ["Answer 1", "Answer 2", "Answer 3"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          // Handle dropdown value change
        },
        hint: Text(defaultItem, style: TextStyle(color: Colors.white)),
        isExpanded: true,
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        elevation: 16,
      ),
    );
  }
}
