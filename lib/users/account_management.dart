import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Information'),
            SizedBox(height: 20),
            Text('Name: John Doe'),
            Text('Email: john.doe@example.com'),
            Text('Contact: +1234567890'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile page
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to change password page
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Log out functionality
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
