// import 'package:ambu_app/system/ambulance_fleet_management.dart';
// import 'package:ambu_app/system/ambulance_routing_tracking.dart';
// import 'package:ambu_app/system/continuous_improvement.dart';
// import 'package:ambu_app/system/dispatcher_management.dart';
// import 'package:ambu_app/system/emergency_response_coordination.dart';
// import 'package:ambu_app/system/regulatory_compliance.dart';
// import 'package:ambu_app/system/system_configuration_settings.dart';
// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Settings',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Ionicons.arrow_back_outline),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   "assets/beautyreg.jpg"), // Change the path to your image
//               fit: BoxFit.cover,
//             ),
//           ),
//           padding: const EdgeInsets.all(20.0), // Add padding here
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(147, 134, 14, 5),
//               borderRadius:
//                   BorderRadius.circular(20.0), // Optional: Add border radius
//             ),
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start, // Align children to the start
//               children: <Widget>[
//                 buildLink('Ambulance Fleet Management', fontSize: 30,
//                     onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const AmbulanceFleetManagementPage()));
//                 }),
//                 buildLink('Dispatcher Management', fontSize: 30, onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const DispatcherManagementPage()));
//                 }),
//                 buildLink('Emergency Response Coordination', fontSize: 30,
//                     onTap: () {
//                   // Navigate to page 3
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               EmergencyResponseCoordinationPage()));
//                 }),
//                 buildLink('System Configuration and Settings', fontSize: 30,
//                     onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               SystemConfigurationSettingsPage()));
//                 }),
//                 buildLink('User Management', fontSize: 30, onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => UserManagementPage()));
//                 }),
//                 buildLink('Ambulance Routing and Tracking', fontSize: 30,
//                     onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               AmbulanceRoutingTrackingPage()));
//                 }),
//                 buildLink('Emergency Preparedness', fontSize: 30, onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => EmergencyPreparednessPage()));
//                 }),
//                 buildLink('Regulatory Compliance', fontSize: 30, onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => RegulatoryCompliancePage()));
//                 }),
//                 buildLink('Data Management and Reporting', fontSize: 30,
//                     onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => DataManagementReportingPage()));
//                 }),
//                 buildLink('Continuous Improvement', fontSize: 30, onTap: () {
//                   // Navigate to page
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ContinuousImprovementPage()));
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLink(String text, {double? fontSize, Function()? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: fontSize,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
