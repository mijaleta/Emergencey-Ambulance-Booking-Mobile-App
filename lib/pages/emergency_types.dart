// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ListView(
//         padding: EdgeInsets.all(24),
//         children: [
//           SettingsGroup(title: 'GENERAL', children: <Widget>[
//             buildLogout(),
//             buildDeleteAccount(),
//           ])
//         ],
//       ),
//     );
//   }
// }

// Widget buildLogout() => SimpleSettingsTile(
//       title: 'Logout',
//       subtitle: '',
//       leading: IconWidget(icon: Icons.logout, color: Colors.black),
//       onTap: () => Utils.showSnackBar(context, 'Clicked Logout'),
//     );

// Widget buildDeleteAccount() => SinpleSettingsTile(
//   title:'Delete Account',
//   subtitle: '',
//   leading: IconWidget(icon:Icons.Delete, color: Colors.pink),
//   onTap: () => Utils.showSnackBar(context, 'Clicked Delete'),
// )
import 'package:flutter/material.dart';

class EmergencyTypes extends StatefulWidget {
  const EmergencyTypes({super.key});

  @override
  State<EmergencyTypes> createState() => _EmergencyTypesState();
}

class _EmergencyTypesState extends State<EmergencyTypes> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}