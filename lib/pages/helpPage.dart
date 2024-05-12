import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        title: const Text(
          'Help',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get Support',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you require immediate assistance, please contact our support team:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // Implement functionality to contact support
                },
                icon: const Icon(Icons.call, color: Colors.white,),
                // SizedBox(width: 15,),
                label: const Text('Contact Support', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Emergency Procedures',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'In case of emergency, here are some important procedures to follow:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            // Add emergency procedures here
            Text(
              '1. Learn basic first aid techniques such as CPR and wound care.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '2. Prepare an emergency kit with essentials like first aid supplies and medication.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '3. Know the location of nearby hospitals and emergency services.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Here are some additional resources and information:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            // Add additional information here
            Text(
              '1. Save important contact numbers, including emergency services and family members.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '2. Familiarize yourself with the symptoms of common medical emergencies.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '3. Keep a list of any medical conditions or allergies your pet may have.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
