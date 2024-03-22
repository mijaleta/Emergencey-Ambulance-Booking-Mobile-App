// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage> {
  List<bool> isTypeSelected = [false, false, false, true, true];
  TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        title: const Text(
          "Feedback",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
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
                        onPressed: () {
                          // Perform submission action
                        },
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

  buildNumberField() {
    return TextField(
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
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "+251",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.cyan,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFC5C5C5),
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ),
          )
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
