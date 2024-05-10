// CarPage.dart
import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Emergency'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'If you are involved in a car accident or witness one, please follow these steps:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            Text(
              '1. Ensure your safety first.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Check on the well-being of others involved.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Call for an ambulance if there are any injuries.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. Do not move injured people unless necessary.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '5. Wait for emergency services to arrive.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
