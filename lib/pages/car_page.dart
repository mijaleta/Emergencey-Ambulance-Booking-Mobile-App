// CarPage.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Car Emergency', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emergency Contact Numbers:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text('Roadside Assistance: 123-456-7890'),
            Text('Towing Services: 987-654-3210'),
            Divider(),
            Text(
              'What to Do in Case of a Car Accident:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text('1. Ensure Safety: Move to a safe location if possible.'),
            Text('2. Contact Emergency Services: Dial 911.'),
            Text('3. Check for Injuries: Administer basic first aid if trained.'),
            Divider(),
            Text(
              'Basic First Aid for Common Car Accident Injuries:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text('1. CPR: Learn CPR techniques to assist someone in cardiac arrest.'),
            Text('2. Bleeding: Apply direct pressure to stop bleeding.'),
            Divider(),
            ElevatedButton(
              onPressed: () => _launchPhoneCall('911'),
              child: Text('Call Emergency Services'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Map with Nearby Hospitals/Clinics:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            // Add a map widget showing nearby hospitals/clinics
            Container(
              height: 200.0,
              color: Colors.grey,
              child: Center(
                child: Text('Map Placeholder'),
              ),
            ),
            // Add additional functionalities as required
          ],
        ),
      ),
    );
  }

  // Function to launch phone call
  void _launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}