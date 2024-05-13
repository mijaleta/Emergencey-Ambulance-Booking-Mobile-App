import 'package:flutter/material.dart';
import 'package:ambu_app/pages/special_request_page.dart';
import 'package:flutter/widgets.dart';

import '../../../pages/patient_req_example.dart';
import '../OSpecialrequest/ospecialrequest.dart';

class OEmergencyTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Gosa Balaa Tasaa filadhu",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/mobile5.jpg',
            ), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestAmbulancePage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ambulansii Gaafachuu',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RequestAmbulancePage(),
                            ),
                          );
                        },
                        child: Text(
                          "Gaaffii Jalqabsiisi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ambulaansii gaafachuu kee dura nageenya kee mirkaneessi, ibsa barbaachisaa ta’e kenni',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'Tasgabbiidhaan haala jiru madaali.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'Miidhaa kamiyyuu ilaaluun yoo danda’ame ammoo gargaarsa jalqabaa bu’uuraa kennuuf yaali.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'Bal’inaan bakka sirrii ta’e kennuun balaa tasaa ifatti/sirriitti ibsi.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OSpecialRequestPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Gaaffi dabalataa/Addaa",
                    style: TextStyle(color: Colors.white),
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
