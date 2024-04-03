import 'package:flutter/material.dart';

class RegisterAmbulance extends StatefulWidget {
  const RegisterAmbulance({super.key});

  @override
  State<RegisterAmbulance> createState() => _RegisterAmbulanceState();
}

class _RegisterAmbulanceState extends State<RegisterAmbulance> {
  // Add variables to store user input and selected dropdown values
  String name = '';
  String hospitalName = '';
  String vehicleType = ''; // Initially selected value for dropdown
  String location = ''; // Initially selected value for dropdown
  String city = ''; // Initially selected value for dropdown

  final List<String> vehicleTypes = [
    'Car',
    'Van',
    'Ambulance'
  ]; // List for vehicle dropdown
  final List<String> locations = [
    'City Center',
    'North Suburbs',
    'South District'
  ]; // List for location dropdown
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago'
  ]; // List for city dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Ambulance'), // Bold text at the top
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) => setState(() => name = value),
            ),
            const SizedBox(height: 10.0), // Add spacing between input fields
            TextField(
              decoration: const InputDecoration(
                labelText: 'Hospital Name',
              ),
              onChanged: (value) => setState(() => hospitalName = value),
            ),
            const SizedBox(height: 10.0), // Add spacing between input fields

            DropdownButtonFormField<String>(
              // First dropdown for vehicle type
              value: vehicleType,
              hint: const Text('Select Vehicle Type'),
              items: vehicleTypes
                  .map((vehicle) => DropdownMenuItem<String>(
                        value: vehicle,
                        child: Text(vehicle),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => vehicleType = value!),
            ),
            const SizedBox(height: 10.0), // Add spacing between dropdowns

            DropdownButtonFormField<String>(
              // Second dropdown for location
              value: location,
              hint: const Text('Select Location'),
              items: locations
                  .map((loc) => DropdownMenuItem<String>(
                        value: loc,
                        child: Text(loc),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => location = value!),
            ),
            const SizedBox(height: 10.0), // Add spacing between dropdowns

            DropdownButtonFormField<String>(
              // Third dropdown for city
              value: city,
              hint: const Text('Select City'),
              items: cities
                  .map((city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => city = value!),
            ),
            const SizedBox(height: 20.0), // Add spacing before buttons

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Center buttons horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Register" button click
                    // Implement logic for registering ambulance data (name, hospital, vehicle type, location, city)
                  },
                  child: const Text('Register'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Cancel" button click
                    // Likely clear input fields and reset dropdown selections
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
