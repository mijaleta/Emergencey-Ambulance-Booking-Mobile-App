import 'dart:io';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/sidebar/driver_sidebar.dart';
import 'package:ambu_app/sidebar/patient_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Driver extends StatefulWidget {
  final String username;

  Driver({required this.username});
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  String driverName = ''; // Add this line

  Location _locationController = Location();
  String ambulanceInfo = 'loaading...';
  String tripInfo = 'Loading...';
  String driverInfo = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadDriverInfo();
  }

  Future<void> _loadDriverInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Assuming 'username' is stored in SharedPreferences upon login
    String? username = prefs.getString('username');
    setState(() {
      // Set the driverName with the username from SharedPreferences
      driverName = username ?? 'No username found';
      driverInfo =
          'Username: $driverName'; // Update driverInfo with the username
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DriverNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Driver',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),

          actions: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.green, // Change the background color here
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: Icon(Icons.logout, color: Colors.white), // Change the icon color
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
                },
              ),
            ),
          ],
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
                      label: 'Driver Information',
                      children: [
                        Text(
                            driverInfo), // This will display the driver's username
                        if (driverName
                            .isNotEmpty) // Check if the name is not empty
                          Text(
                              'Name: $driverName'), // This will display the name
                      ],
                    ),

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

                    const SizedBox(height: 20),
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
                      description:
                          'Track the patient\'s location during the trip',
                      icon: Icons.location_on,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PatientTrackingPage()));
                      },
                    ),
                    BeautifulCard(
                      title: 'Access Emergency Procedures',
                      description:
                          'Access protocols for handling medical emergencies',
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
    print(
        'Updating user settings - Notifications Enabled: $notificationEnabled');
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
    return AlertDialog(
      title: Text('View Reports'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('List of Trip Reports'),
          Text('1. Trip Report while Labour Mother'),
          Text('2. Trip Report During Injury'),
          Text('3. Trip Report Car Emergency'),

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
            },
          ),
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
  const CallScreen({super.key});

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
        backgroundColor: Colors.blue,
        title: const Text(
          'Call Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Caller: Chala Kebede'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                hintText: '+251961305788',
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust as desired
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust as desired
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.mic_off),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.pause),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.call_end),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('00:10:32'), // Call duration timer
          SizedBox(height: 20),
          Text('00:10:32'), // Call duration timer
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String phoneNumber = _phoneNumberController.text;
                  // Validate phone number (optional)
                  _makePhoneCall('tel:$phoneNumber');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Call',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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

  Future<void> _reportIncident() async {
    if (_attachedFiles == null || _attachedFiles!.isEmpty) {
      // Show error message if no files are attached
      _showErrorMessage(
          'Please attach photos/videos before reporting the incident.');
      return;
    }

    // Implement your incident reporting logic here
    // You can access the file paths using _attachedFiles.map((file) => file.path).toList()

    // Show success dialog
    _showSuccessDialog('Incident reported successfully!');
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildAttachedItem(XFile file) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: FileImage(File(file.path)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Report Incident Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Attach Photos/Videos',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
            ),
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
                    children: List.generate(
                      _attachedFiles!.length,
                      (index) {
                        return _buildAttachedItem(_attachedFiles![index]);
                      },
                    ),
                  ),
            SizedBox(height: 20),
            Text('Incident Details'),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text('Select Severity Level')),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'Low',
                      child: Text('Low'),
                    ),
                    DropdownMenuItem(
                      value: 'Medium',
                      child: Text('Medium'),
                    ),
                    DropdownMenuItem(
                      value: 'High',
                      child: Text('High'),
                    ),
                  ],
                  onChanged: (value) {},
                  value: 'Low', // Default value
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _reportIncident,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'Report Incident',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAttachedItem(XFile file) {
  return Stack(
    children: [
      SizedBox(
        width: 100,
        height: 100,
        child: file.mimeType!.startsWith('image/')
            ? Image.file(File(file.path))
            : const Icon(Icons.videocam),
      ),
      Positioned(
        right: 0,
        top: 0,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // setState(() {
            //   _attachedFiles!.remove(file);
            // });
          },
        ),
      ),
    ],
  );
}

class PanicSignalScreen extends StatelessWidget {
  const PanicSignalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Panic Signal Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Send Panic Signal',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text('Your Current Location:'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 400, // Adjust the height according to your design
                    color: Colors.grey[200],
                    child: FutureBuilder<LocationData>(
                      future: _getLocation(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final locationData = snapshot.data!;
                          return FlutterMap(
                            options: MapOptions(
                              center: LatLng(locationData.latitude!,
                                  locationData.longitude!),
                              zoom: 13,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a', 'b', 'c'],
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: LatLng(locationData.latitude!,
                                        locationData.longitude!),
                                    builder: (ctx) => Container(
                                      child: Icon(Icons.location_on,
                                          size: 50, color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              RichAttributionWidget(
                                attributions: [
                                  TextSourceAttribution(
                                    'OpenStreetMap contributors',
                                    onTap: () => launchUrl(Uri.parse(
                                        'https://openstreetmap.org/copyright')),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Additional Notes (Optional)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _sendPanicSignal(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Send Panic Signal',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async {
    Location location = Location();

    try {
      return await location.getLocation();
    } catch (e) {
      throw ('Failed to get location: $e');
    }
  }

  void _sendPanicSignal(BuildContext context) {
    // Implement panic signal logic
    // Placeholder for success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Panic signal sent successfully!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class SafetyChecklistScreen extends StatefulWidget {
  @override
  _SafetyChecklistScreenState createState() => _SafetyChecklistScreenState();
}

class _SafetyChecklistScreenState extends State<SafetyChecklistScreen> {
  // List to store completion status of each checklist item
  final List<bool> _isChecked = [
    false,
    false,
    false
  ]; // Replace with actual data

  bool _isSubmitting = false;

  void _handleCheckboxChange(int index, bool value) {
    setState(() {
      _isChecked[index] = value;
    });
  }

  Future<void> _submitChecklist() async {
    // Check if all checkboxes are selected
    if (_isChecked.every((isChecked) => !isChecked)) {
      // Show error dialog if any checkbox is not selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please ensure atleast one checkbox is selected.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Exit the method early if any checkbox is not selected
    }

    // Implement logic to submit checklist data (e.g., save to database)
    // You can access completion status from _isChecked list

    // Placeholder for submission
    setState(() {
      _isSubmitting = true;
    });

    try {
      // Simulate submission delay (replace with actual submission logic)
      await Future.delayed(Duration(seconds: 2));

      // After submission, reset the checklist and show a success dialog
      setState(() {
        _isSubmitting = false;
        _isChecked.fillRange(0, _isChecked.length, false);
      });

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Checklist submitted successfully!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle submission error
      setState(() {
        _isSubmitting = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to submit checklist: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Safety Checklist Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Pre-Work Safety Checklist',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            CheckboxListTile(
              title: Text('Ensure all equipment is in good working order'),
              value: _isChecked[0],
              onChanged: (value) => _handleCheckboxChange(0, value!),
            ),
            CheckboxListTile(
              title:
                  Text('Wear appropriate Personal Protective Equipment (PPE)'),
              value: _isChecked[1],
              onChanged: (value) => _handleCheckboxChange(1, value!),
            ),
            CheckboxListTile(
              title: Text(
                  'Identify and clear any potential hazards in the work area'),
              value: _isChecked[2],
              onChanged: (value) => _handleCheckboxChange(2, value!),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitChecklist,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Submit Checklist',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
