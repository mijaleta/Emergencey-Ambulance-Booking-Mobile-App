import 'package:ambu_app/pages/logout.dart';
import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {
  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  String? _selectedAvailability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Availability Status',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            DropdownButton<String>(
              value: _selectedAvailability,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAvailability = newValue;
                });
              },
              items: <String?>['Available', 'Busy', 'Offline']
                  .map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value ?? ''),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Booking Requests',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Booking $index'),
                    subtitle: Text(
                        'Pickup: Location $index - Destination: Location ${index + 1}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Handle accepting booking
                      },
                      child: Text('Accept'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Booking History',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Booking $index'),
                    subtitle: Text(
                        'Date: ${DateTime.now().subtract(Duration(days: index)).toString()}'),
                    onTap: () {
                      // Handle tapping on history item
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle logout action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Logout()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
