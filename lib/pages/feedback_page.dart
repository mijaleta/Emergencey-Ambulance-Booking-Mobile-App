// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);
  @override
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage> {
  List<bool> isTypeSelected = [false, false, false, true, true];
  TextEditingController contactNumberController = TextEditingController();
// added code for backend
  // Define a list of feedback type strings
  final List<String> feedbackTypes = [
    "Login trouble",
    "Phone number related",
    "Personal profile",
    "Other issues",
    "Suggestions",
  ];

  // Define a TextEditingController for the feedback text
  TextEditingController feedbackTextController = TextEditingController();
  // ... your existing methods ...
  // Make sure to dispose controllers when the state is disposed
  @override
  void dispose() {
    contactNumberController.dispose();
    feedbackTextController.dispose();
    super.dispose();
  }

  // Function to submit feedback
  Future<void> submitFeedback() async {
    // Convert the selected feedback types to a list of strings
    List<String> selectedFeedbackTypes = [];
    for (int i = 0; i < isTypeSelected.length; i++) {
      if (isTypeSelected[i]) {
        selectedFeedbackTypes.add(feedbackTypes[
            i]); // Assuming you have a list of feedback type strings
      }
    }

    // Construct the feedback data
    Map<String, dynamic> feedbackData = {
      'contactNumber': contactNumberController.text,
      'feedbackType': selectedFeedbackTypes,
      'feedbackText': feedbackTextController
          .text, // Assuming you have a TextEditingController for feedback text
    };

    // Send the feedback data to the backend
    var response = await http.post(
      // Uri.parse('http://yourbackend.com/submit-feedback'), // Replace with your backend URL
      //  Uri.parse('http://192.168.0.65:3000/submit-feedback'),
      Uri.parse(
          'http://ambulance-website.samiintegratedfarm.com/submit-feedback'),

      //  Uri.parse('http://192.168.185.172:3000/submit-feedback'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(feedbackData),
    );

    // Check the response status
    if (response.statusCode == 201) {
      // Handle successful submission
      // Navigate to the SuccessPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );
      print('Feedback submitted successfully');
    } else {
      // Handle error
      print('Failed to submit feedback: ${response.body}');
    }
  }

// added code for backend
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        centerTitle: true,
        title: const Text(
          "Feedback ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Please select the type of the feedback",
                style: TextStyle(
                  color: Color(0xFFC5C5C5),
                ),
              ),
              const SizedBox(height: 25.0),
              GestureDetector(
                child: buildCheckItem(
                    title: "Login trouble", isSelected: isTypeSelected[0]),
                onTap: () {
                  setState(() {
                    isTypeSelected[0] = !isTypeSelected[0];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Phone number related",
                    isSelected: isTypeSelected[1]),
                onTap: () {
                  setState(() {
                    isTypeSelected[1] = !isTypeSelected[1];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Personal profile", isSelected: isTypeSelected[2]),
                onTap: () {
                  setState(() {
                    isTypeSelected[2] = !isTypeSelected[2];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Other issues", isSelected: isTypeSelected[3]),
                onTap: () {
                  setState(() {
                    isTypeSelected[3] = !isTypeSelected[3];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Suggestions", isSelected: isTypeSelected[4]),
                onTap: () {
                  setState(() {
                    isTypeSelected[4] = !isTypeSelected[4];
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              buildFeedbackForm(),
              const SizedBox(height: 20.0),
              buildNumberField(),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.black,
                      ),
                      child: TextButton(
                        onPressed: submitFeedback,
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// added now with form validation
  TextFormField buildNumberField() {
    return TextFormField(
      controller: contactNumberController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Color(0xFFC5C5C5),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10.0),
                  const Text(
                    "+251",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.cyan),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
        hintStyle: TextStyle(fontSize: 14.0, color: Color(0xFFC5C5C5)),
        hintText: "Phone Number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
    );
  }

// added now with form validation

  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
            controller: feedbackTextController, // Set the controller here

            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xFFC5C5C5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}

// succe page
class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submission Successful',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            Text(
              'Thank you for your feedback!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text(
                    'Return to Home',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
