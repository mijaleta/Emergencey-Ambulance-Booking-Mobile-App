import 'package:flutter/material.dart';

class LabourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Labour Emergency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Signs of Labour and When to Seek Medical Assistance',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Regular Contractions'),
              Text('2. Water Breaking'),
              Text('3. Increasing Pain or Pressure'),
              Divider(),
              Text(
                'What to Pack for the Hospital or Birthing Center',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Hospital Bag with Essentials'),
              Text('2. Comfort Items: Pillows, Blankets'),
              Divider(),
              Text(
                'Important Phone Numbers:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('Obstetrician/Midwife: 123-456-7890'),
              Text('Hospital: 987-654-3210'),
              Divider(),
              Text(
                'Additional Advice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'If labour begins, try to remain calm and focused. Remember to breathe deeply and follow any instructions provided by medical professionals.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Guidance on Timing Contractions and When to Go to the Hospital',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Use a contraction timer app to track contractions.'),
              Text('2. Time contractions from the beginning of one to the beginning of the next.'),
              Text('3. Contact your healthcare provider or go to the hospital when contractions are regular and about 5 minutes apart.'),
              Divider(),
              Text(
                'Information on Different Birthing Options and Pain Relief Methods',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Discuss birthing options with your healthcare provider.'),
              Text('2. Explore pain relief methods such as breathing techniques, massage, or medication.'),
              Divider(),
              Text(
                'Resources for Prenatal Classes or Support Groups',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Search for prenatal classes or support groups in your area.'),
              Text('2. Attend classes or join support groups for additional guidance and support.'),
              Divider(),
              Text(
                'Tips for Creating a Birth Plan and Communicating Preferences with Medical Staff',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Write down your birth preferences and discuss them with your healthcare provider.'),
              Text('2. Communicate your preferences with the medical staff at the hospital or birthing center.'),
              Divider(),
              Text(
                'Information on Postpartum Care and Support Services',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Learn about postpartum care and recovery.'),
              Text('2. Seek support from family, friends, or postpartum support groups.'),
            ],
          ),
        ),
      ),
    );
  }
}
