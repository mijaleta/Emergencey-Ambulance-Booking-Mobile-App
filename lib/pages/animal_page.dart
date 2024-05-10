// AnimalPage.dart
import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Emergency'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'If an animal is in need of urgent care, follow these steps:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            Text(
              '1. Approach the animal carefully to avoid harm.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Call animal control or a veterinary clinic.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Provide basic first aid if you are trained.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. Keep the animal warm and still until help arrives.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '5. Do not give any food or water unless instructed by a professional.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
