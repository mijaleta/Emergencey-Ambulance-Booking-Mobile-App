import 'package:ambu_app/models/patient.dart'; // Import the Patient model

class AmbulanceBookingService {
  void bookAmbulance(Patient patient) {
    // Logic to book the ambulance would go here
    // For the sake of demonstration, let's just print the patient details
    print('Ambulance booked for: ${patient.name}');
    print('Location: ${patient.location}');
    print('Destination: ${patient.destination}');
    // Additional logic to actually book an ambulance with a service would go here
  }
}
