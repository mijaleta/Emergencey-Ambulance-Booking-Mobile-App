// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// class NursePage extends StatefulWidget {
//   const NursePage({super.key});

//   @override
//   State<NursePage> createState() => _NursePageState();
// }

// class _NursePageState extends State<NursePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Ionicons.chevron_back_outline)),
//         title: const Text('Nurse Screen'),
//       ),
//       body: const Center(
//         child: Text(
//           'Nurse Page',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }
// }
import 'package:ambu_app/models/patient.dart'; // Import the Patient model
import 'package:ambu_app/services/ambulance_booking_service.dart'; // Import the AmbulanceBookingService
import 'package:flutter/material.dart';

class NursePage extends StatefulWidget {
  @override
  _NursePageState createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _patientAgeController = TextEditingController();
  TextEditingController _patientGenderController = TextEditingController();
  TextEditingController _patientContactController = TextEditingController();
  TextEditingController _chiefComplaintController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _emergencyContactController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nurse Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _patientNameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              TextFormField(
                controller: _patientAgeController,
                decoration: InputDecoration(labelText: 'Patient Age'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _patientGenderController,
                decoration: InputDecoration(labelText: 'Patient Gender'),
              ),
              TextFormField(
                controller: _patientContactController,
                decoration: InputDecoration(labelText: 'Patient Contact'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _chiefComplaintController,
                decoration: InputDecoration(labelText: 'Chief Complaint'),
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(labelText: 'Destination'),
              ),
              TextFormField(
                controller: _emergencyContactController,
                decoration: InputDecoration(labelText: 'Emergency Contact'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(labelText: 'Notes'),
                maxLines: null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _bookAmbulance();
                },
                child: Text('Book Ambulance'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _bookAmbulance() {
    // Create a Patient object with the entered details
    Patient patient = Patient(
      name: _patientNameController.text,
      age: int.tryParse(_patientAgeController.text) ?? 0,
      gender: _patientGenderController.text,
      contact: _patientContactController.text,
      chiefComplaint: _chiefComplaintController.text,
      location: _locationController.text,
      destination: _destinationController.text,
      emergencyContact: _emergencyContactController.text,
      notes: _notesController.text,
    );

    // Call the ambulance booking service to book the ambulance
    AmbulanceBookingService().bookAmbulance(patient);

    // Show confirmation dialog or navigate to another screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ambulance Booked'),
          content: Text('Ambulance has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
