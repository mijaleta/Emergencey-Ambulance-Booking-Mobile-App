import 'dart:io';

import 'package:ambu_app/sidebar/driver_sidebar.dart';
import 'package:ambu_app/sidebar/patient_tracking.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

// Define MongoDB connection parameters
// final String mongoUrl = 'mongodb://localhost:27017';
// final String dbName = 'ambulance-website';


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

  // Define MongoDB connection parameters
  final String mongoUrl = 'mongodb://localhost:27017'; // MongoDB connection URI
  final String dbName = 'your_database_name'; // Your database name
  late mongo.Db db; // MongoDB client 

  @override
  void initState() {
    super.initState();
    fetchAmbulanceInfo();
    // fetchTripInfo();
    fetchDriverInfo();
    // Connect to MongoDB when the widget initializes
    connectToMongo();
  }
  // Function to connect to MongoDB
  void connectToMongo() async {
    db = mongo.Db(mongoUrl);
    await db.open();
    // You can perform additional database operations here
    // For example, fetch data from the database
    fetchData();
  }

  // Function to fetch data from the database
  void fetchData() async {
    // Perform database queries here
    // For example:
    var collection = db.collection('ambulances');
    var documents = await collection.find().toList();
    // Update the UI with the fetched data
    setState(() {
      // Update state variables or UI elements with the fetched data
    });
  }

  @override
  void dispose() {
    // Close the MongoDB connection when the widget is disposed
    db.close();
    super.dispose();
  }

  void fetchAmbulanceInfo() async {
    var ambulanceCollection = db.collection('ambulances');
    var ambulanceQuery = mongo.where.eq('assignedDriver', 'specific_driver_id');
    var ambulanceResult = await ambulanceCollection.findOne(ambulanceQuery);

    if (ambulanceResult != null) {
      setState(() {
        ambulanceInfo =
        'Ambulance Type: ${ambulanceResult['type']}\nModel: ${ambulanceResult['model']}\nRegistration Number: ${ambulanceResult['registrationNumber']}';
      });
    } else {
      setState(() {
        ambulanceInfo = 'Ambulance not found';
      });
    }
  }

  void fetchDriverInfo() async {
    var driverCollection = db.collection('drivers');
    var driverQuery = mongo.where.eq('_id', 'specific_driver_id');
    var driverResult = await driverCollection.findOne(driverQuery);

    if (driverResult != null) {
      setState(() {
        driverInfo =
        'Name: ${driverResult['name']}\nLicense: ${driverResult['license']}\nShift Schedule: ${driverResult['shiftSchedule']}\nPerformance: ${driverResult['performance']}';
      });
    } else {
      setState(() {
        driverInfo = 'Driver not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:const DriverNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Driver', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
        ),
        // drawer: const Drawer(
        //         //   // Add your drawer content here
        //         // ),
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
                    // InformationDisplay widgets for displaying ambulance, trip, and driver information
                    // These widgets will display fetched information from MongoDB
                    AnimatedCard(
                      icon: Icons.phone,
                      title: 'Call',
                      onPressed: () => _initiateCall(context),
                    ),
                    AnimatedCard(
                      icon: Icons.warning,
                      title: 'Report Incident',
                      onPressed: () => _reportIncident(context),
                    ),
                    AnimatedCard(
                      icon: Icons.dangerous,
                      title: 'Send Panic Signal',
                      onPressed: () => _sendPanicSignal(context),
                    ),
                    AnimatedCard(
                      icon: Icons.checklist,
                      title: 'Safety Checklist',
                      onPressed: () => _performSafetyChecklist(context),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const PatientTrackingPage()));
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

void _initiateCall(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CallScreen()),
  );
}

void _reportIncident(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ReportIncidentScreen()),
  );
}

void _sendPanicSignal(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PanicSignalScreen()),
  );
}

void _performSafetyChecklist(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SafetyChecklistScreen()),
  );
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

  // Function to simulate updating user settings in the database
  // Replace this with actual database interaction code
  void updateUserSettings({required bool notificationEnabled}) {
    // Simulated database update
    print('Updating user settings - Notifications Enabled: $notificationEnabled');
  }

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
              updateUserSettings(notificationEnabled: value);
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
            builder: (context) => const PatientTrackingPage(),
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

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final _phoneNumberController = TextEditingController();

  bool _showHint = true;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _animateHint() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _showHint = !_showHint;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _showHint = !_showHint;
    });
  }

  @override
  void initState() {
    super.initState();
    _animateHint(); // Start the animation on widget initialization
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Caller: Chala Kebede'),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                hintText: '+251961305788',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust as desired
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust as desired
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.mic_off),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.pause),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.call_end),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('00:10:32'), // Call duration timer
          ElevatedButton(
            onPressed: () {
              String phoneNumber = _phoneNumberController.text;
              // Validate phone number (optional)
              _makePhoneCall('tel:$phoneNumber');
            },
            child:const Text('Call'),
          ),
        ],
      ),
    );
  }
}


class ReportIncidentScreen extends StatefulWidget {
  @override
  _ReportIncidentScreenState createState() => _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends State<ReportIncidentScreen> {
  final _picker = ImagePicker();
  List<XFile>? _attachedFiles; // List to store picked images/videos

  Future<void> _pickMedia() async {
    final storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }

    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _attachedFiles = pickedFiles;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Report Incident Screen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Attach Photos/Videos:'),
            SizedBox(height: 10),
            _attachedFiles == null
                ? InkWell(
              onTap: _pickMedia,
              child: Container(
                height: 150, // Adjust the height according to your design
                color: Colors.grey[200],
                child: Center(child: Text('Tap to Attach')),
              ),
            )
                : Wrap(
              spacing: 10,
              children: List.generate(_attachedFiles!.length, (index) {
                return _buildAttachedItem(_attachedFiles![index]);
              }),
            ),
            SizedBox(height: 20),
            Text('Incident Details:'),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Select Severity Level:'),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text('Low'),
                  value: 'Low',
                ),
                DropdownMenuItem(
                  child: Text('Medium'),
                  value: 'Medium',
                ),
                DropdownMenuItem(
                  child: Text('High'),
                  value: 'High',
                ),
              ],
              onChanged: (value) {},
              value: 'Low', // Default value
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement incident reporting logic with attached files
                // You can access the file paths using _attachedFiles.map((file) => file.path).toList()
              },
              child: Text('Report Incident'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachedItem(XFile file) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          child: file.mimeType!.startsWith('image/')
              ? Image.file(File(file.path))
              : Icon(Icons.videocam),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                _attachedFiles!.remove(file);
              });
            },
          ),
        ),
      ],
    );
  }
}

class PanicSignalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Signal Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Send Panic Signal'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement panic signal logic
              },
              child: Text('Send Panic Signal'),
            ),
            SizedBox(height: 20),
            Text('Your Current Location:'),
            SizedBox(height: 10),
            Container(
              height: 200, // Adjust the height according to your design
              color: Colors.grey[200],
              child: Center(child: Text('Map Widget')),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Additional Notes (Optional)',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SafetyChecklistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Checklist Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Safety Checklist:'),
            CheckboxListTile(
              title: Text('Checklist Item 1'),
              value: true, // Replace with actual completion status
              onChanged: (value) {
                // Implement checkbox logic
              },
            ),
            CheckboxListTile(
              title: Text('Checklist Item 2'),
              value: false, // Replace with actual completion status
              onChanged: (value) {
                // Implement checkbox logic
              },
            ),
            CheckboxListTile(
              title: Text('Checklist Item 3'),
              value: false, // Replace with actual completion status
              onChanged: (value) {
                // Implement checkbox logic
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit checklist logic
              },
              child: Text('Submit Checklist'),
            ),
          ],
        ),
      ),
    );
  }
}
