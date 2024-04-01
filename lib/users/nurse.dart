// import 'package:flutter/material.dart';

// class NurseHistoryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nurse History'),
//       ),
//       body: ListView.builder(
//         itemCount: 10, // Example number of past requests
//         itemBuilder: (context, index) {
//           // Sample data for a request
//           String patientName = 'Patient Name';
//           String dateTime = 'MM/DD/YYYY, HH:MM';
//           String serviceType = 'Emergency'; // Or 'Non-Emergency'
//           String ambulanceAssigned = 'Ambulance ID: XXXX';
//           String driverDetails = 'Driver Name, Contact';
//           String requestStatus = 'Completed'; // Or 'Canceled', 'Ongoing', etc.
//           String notes = 'Additional notes or instructions';

//           return ListTile(
//             title: Text('Patient: $patientName'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Date & Time: $dateTime'),
//                 Text('Service Type: $serviceType'),
//                 Text('Ambulance: $ambulanceAssigned'),
//                 Text('Driver: $driverDetails'),
//                 Text('Status: $requestStatus'),
//                 Text('Notes: $notes'),
//               ],
//             ),
//             trailing: Icon(Icons.info), // Option to view more details
//             onTap: () {
//               // Navigate to detailed view of the request
//             },
//           );
//         },
//       ),
//     );
//   }
// }
