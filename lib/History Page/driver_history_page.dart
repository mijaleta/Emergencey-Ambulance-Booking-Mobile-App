import 'package:flutter/material.dart';

class DriverHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver History'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example number of past trips
        itemBuilder: (context, index) {
          // Sample data for a trip
          String tripId = 'XXXXXXXX';
          String dateTime = 'MM/DD/YYYY, HH:MM';
          String pickupLocation = 'Pickup Location';
          String dropoffLocation = 'Drop-off Location';
          String patientDetails = 'Patient Name, Age';
          String tripStatus = 'Completed'; // Or 'Canceled', 'Ongoing', etc.
          String notes = 'Additional notes or instructions';

          return ListTile(
            title: Text('Trip ID: $tripId'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date & Time: $dateTime'),
                Text('Pickup: $pickupLocation'),
                Text('Drop-off: $dropoffLocation'),
                Text('Patient: $patientDetails'),
                Text('Status: $tripStatus'),
                Text('Notes: $notes'),
              ],
            ),
            trailing: Icon(Icons.info), // Option to view more details
            onTap: () {
              // Navigate to detailed view of the trip
            },
          );
        },
      ),
    );
  }
}
