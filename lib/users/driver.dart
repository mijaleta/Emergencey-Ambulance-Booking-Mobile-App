import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  Location _locationController = Location();
  String ambulanceInfo = 'Loading...';
  String tripInfo = 'Loading...';
  String driverInfo = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchAmbulanceInfo();
    fetchTripInfo();
    fetchDriverInfo();
  }

  void fetchAmbulanceInfo() {
    setState(() {
      ambulanceInfo =
      'Ambulance Type: XYZ\nModel: ABC\nRegistration Number: 123';
    });
  }

  void fetchTripInfo() {
    setState(() {
      tripInfo =
      'Patient Name: Great Beki\nAge: 35\nCondition: Stable\nAllergies: None\nPickup Location: ABC Hospital\nDrop-off Location: XYZ Clinic\nEstimated Arrival: 10 minutes';
    });
  }

  void fetchDriverInfo() {
    setState(() {
      driverInfo =
      'Name: Miretu Jaleta\nLicense: ABC123\nShift Schedule: 8 AM - 5 PM\nPerformance: Excellent';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Driver'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
        ),
        drawer: const Drawer(
          // Add your drawer content here
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationDisplay(
                      label: 'Ambulance Information',
                      children: [
                        Text(ambulanceInfo),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Trip Information',
                      children: [
                        Text(tripInfo),
                      ],
                    ),
                    InformationDisplay(
                      label: 'Driver Information',
                      children: [
                        Text(driverInfo),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AnimatedCard(
                      icon: Icons.phone,
                      title: 'Call',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Call"),
                              content: Text("Initiate a call to the trip requester to clarify details or provide assistance."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    AnimatedCard(
                      icon: Icons.warning,
                      title: 'Report Incident',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Report Incident"),
                              content: Text("Report an incident with photos or voice recordings."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    AnimatedCard(
                      icon: Icons.dangerous,
                      title: 'Send Panic Signal',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Send Panic Signal"),
                              content: Text("Send a distress signal with location data."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    AnimatedCard(
                      icon: Icons.checklist,
                      title: 'Safety Checklist',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Safety Checklist"),
                              content: Text("Perform a digital checklist for equipment checks."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BeautifulCard(
                      title: 'Receive Notifications',
                      description:
                      'Receive alerts for new trip requests, updates, or announcements',
                      icon: Icons.notifications,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReceiveNotificationsDialog();
                          },
                        );
                      },
                    ),
                    BeautifulCard(
                      title: 'Track Patient',
                      description: 'Track the patient\'s location during the trip',
                      icon: Icons.location_on,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TrackPatientDialog();
                          },
                        );
                      },
                    ),
                    BeautifulCard(
                      title: 'Access Emergency Procedures',
                      description: 'Access protocols for handling medical emergencies',
                      icon: Icons.medical_services,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EmergencyProceduresDialog();
                          },
                        );
                      },
                    ),
                    BeautifulCard(
                      title: 'Access Offline Functionality',
                      description: 'Access certain functionalities offline',
                      icon: Icons.offline_bolt,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AccessOfflineFunctionalityDialog();
                          },
                        );
                      },
                    ),
                    BeautifulCard(
                      title: 'View Reports',
                      description: 'View reports and analytics for trips',
                      icon: Icons.analytics,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ViewReportsDialog();
                          },
                        );
                      },
                    ),
                    BeautifulCard(
                      title: 'Settings',
                      description: 'Adjust app settings',
                      icon: Icons.settings,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SettingsDialog();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const AnimatedCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationDisplay extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const InformationDisplay({
    Key? key,
    required this.label,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 20),
      ],
    );
  }
}

class BeautifulCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  const BeautifulCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 36,
              color: Colors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiveNotificationsDialog extends StatefulWidget {
  @override
  _ReceiveNotificationsDialogState createState() =>
      _ReceiveNotificationsDialogState();
}

class _ReceiveNotificationsDialogState
    extends State<ReceiveNotificationsDialog> {
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Receive Notifications'),
      content: Row(
        children: [
          Expanded(
            child: Text('Enable Notifications'),
          ),
          Switch(
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
              // Perform database interaction here to update user settings
              // Example: Update user's notification preference in the database
              // database.updateUserSettings(notificationEnabled: value);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

class TrackPatientDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      icon: Icons.location_on,
      title: 'Track Patient',
      onPressed: () {
        // Navigate to the TrackPatientMapPage when the card is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientTrackingPage(),
          ),
        );
      },
    );
  }
}

class EmergencyProceduresDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Perform database interaction here to retrieve emergency procedures
    // Example: Fetch emergency procedures from the database
    // List<Procedure> emergencyProcedures = database.getEmergencyProcedures();
    return AlertDialog(
      title: Text('Emergency Procedures'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('List of Emergency Procedures:'),
          // Display the list of procedures here
          // Replace this with a ListView or other suitable widget
          Text('1. Procedure 1'),
          Text('2. Procedure 2'),
          Text('3. Procedure 3'),
          // Add more procedures as needed
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

class AccessOfflineFunctionalityDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This dialog box may not directly interact with the database
    // It can present a predefined list of offline features
    return AlertDialog(
      title: Text('Access Offline Functionality'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Features Available Offline:'),
          // Display the list of offline features here
          // Replace this with a ListView or other suitable widget
          Text('1. Feature 1'),
          Text('2. Feature 2'),
          Text('3. Feature 3'),
          // Add more features as needed
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

class ViewReportsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Perform database interaction here to retrieve trip reports
    // Example: Fetch trip reports from the database
    // List<TripReport> tripReports = database.getTripReports();
    return AlertDialog(
      title: Text('View Reports'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('List of Trip Reports:'),
          // Display the list of trip reports here
          // Replace this with a ListView or other suitable widget
          Text('1. Trip Report 1'),
          Text('2. Trip Report 2'),
          Text('3. Trip Report 3'),
          // Add more trip reports as needed
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

class SettingsDialog extends StatefulWidget {
  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Settings'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dark Mode'),
          Switch(
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
              // Perform database interaction here to update user settings
              // Example: Update user's dark mode preference in the database
              // database.updateUserSettings(darkModeEnabled: value);
            },
          ),
          // Add more settings options as needed
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
