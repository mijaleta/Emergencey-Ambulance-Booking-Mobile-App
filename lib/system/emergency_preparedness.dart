import 'package:flutter/material.dart';

class EmergencyPreparednessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Preparedness'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emergency Protocols and Procedures',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Documentation viewer for emergency protocols and procedures
                  _buildDocumentationViewer(),
                  SizedBox(height: 20),
                  Text(
                    'Drills and Training Sessions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Calendar for scheduling drills and training sessions
                  _buildCalendar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentationViewer() {
    // Implement your documentation viewer widget here
    return Text('Documentation Viewer');
  }

  Widget _buildCalendar() {
    // Implement your calendar widget here
    return Text('Calendar');
  }
}
