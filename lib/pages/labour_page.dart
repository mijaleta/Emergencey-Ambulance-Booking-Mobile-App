// LabourPage.dart
import 'package:flutter/material.dart';

class LabourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labour Emergency'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'If you or someone is in labour, please do the following:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            Text(
              '1. Stay calm and call for an ambulance.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Make the person comfortable.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Do not attempt to deliver the baby unless trained.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. Prepare any necessary documents for the hospital.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '5. Wait for the medical professionals to arrive.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
