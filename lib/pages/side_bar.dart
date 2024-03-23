import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onBookPressed;
  final VoidCallback onHistoryPressed;
  final VoidCallback onAmbulanceTypesPressed;
  final VoidCallback onAccountPressed;
  final VoidCallback onSettingsPressed;
  final VoidCallback onHelpPressed;
  final VoidCallback onLogoutPressed;

  const Sidebar({
    required this.onHomePressed,
    required this.onBookPressed,
    required this.onHistoryPressed,
    required this.onAmbulanceTypesPressed,
    required this.onAccountPressed,
    required this.onSettingsPressed,
    required this.onHelpPressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Sidebar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: onHomePressed,
          ),
          ListTile(
            title: Text('Book'),
            onTap: onBookPressed,
          ),
          ListTile(
            title: Text('History'),
            onTap: onHistoryPressed,
          ),
          ListTile(
            title: Text('Ambulance Types'),
            onTap: onAmbulanceTypesPressed,
          ),
          ListTile(
            title: Text('Account'),
            onTap: onAccountPressed,
          ),
          ListTile(
            title: Text('Settings'),
            onTap: onSettingsPressed,
          ),
          ListTile(
            title: Text('Help'),
            onTap: onHelpPressed,
          ),
          ListTile(
            title: Text('Logout'),
            onTap: onLogoutPressed,
          ),
        ],
      ),
    );
  }
}
