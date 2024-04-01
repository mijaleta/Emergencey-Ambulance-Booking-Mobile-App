import 'package:flutter/material.dart';

class DispatcherHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispatcher History'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example number of past activities
        itemBuilder: (context, index) {
          // Sample data for an activity
          String activityType = 'Trip'; // Or 'Request', 'Interaction', etc.
          String activityId = 'XXXXXXXX';
          String dateTime = 'MM/DD/YYYY, HH:MM';
          String details = 'Additional details or notes';
          String status = 'Completed'; // Or 'Pending', 'Ongoing', etc.

          return ListTile(
            title: Text('$activityType ID: $activityId'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date & Time: $dateTime'),
                Text('Details: $details'),
                Text('Status: $status'),
              ],
            ),
            trailing: Icon(Icons.info), // Option to view more details
            onTap: () {
              // Navigate to detailed view of the activity
            },
          );
        },
      ),
    );
  }
}
