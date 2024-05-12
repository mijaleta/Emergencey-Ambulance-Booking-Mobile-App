import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Animal Emergency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What to Do in Case of an Animal Bite or Attack',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Wash the Wound Thoroughly with Soap and Water.'),
              Text('2. Apply Antibiotic Ointment and Bandage.'),
              Text('3. Seek Medical Attention if Necessary.'),
              Divider(),
              Text(
                'Assessing the Severity of the Injury',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Observe for Excessive Bleeding or Signs of Infection.'),
              Text('2. Assess Range of Motion and Sensation.'),
              Divider(),
              Text(
                'Emergency Contact Numbers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              // GestureDetector(
              //   onTap: () {
              //     _launchPhoneCall('+251918684281'); // Replace with your phone number
              //   },
              //   child: Text('Animal Control: +251 91 868 4281'),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     _launchPhoneCall('+251996826264'); // Replace with your phone number
              //   },
              //   child: Text('Veterinary Clinic: +251 99 682 6264'),
              // ),
              buildPhoneNumberLink('Animal Control: ', '+251 91 868 4281', Colors.black, Colors.blue),
              buildPhoneNumberLink('Veterinary Clinic: ', '+251 99 682 6264', Colors.black, Colors.blue),

              Divider(),
              Text(
                'Additional Advice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'If an animal is in need of urgent care, follow these steps:',
              ),
              Text(
                '1. Approach the animal carefully to avoid harm.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2. Call animal control or a veterinary clinic.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3. Provide basic first aid if you are trained.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '4. Keep the animal warm and still until help arrives.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '5. Do not give any food or water unless instructed by a professional.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Display Information on Rabies Prevention and What to Do If Bitten by a Potentially Rabid Animal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Wash the wound thoroughly and seek medical attention immediately.'),
              Text('2. Report the incident to local health authorities.'),
              Text('3. Consider getting a rabies vaccination if recommended by a healthcare professional.'),
              Divider(),
              Text(
                'Guidance on How to Safely Approach and Handle Injured Animals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Approach the animal slowly and calmly to avoid further injury.'),
              Text('2. Use protective gear such as gloves if available.'),
              Text('3. Avoid making sudden movements or loud noises.'),
              Divider(),
              Text(
                'Resources for Locating Lost Pets or Reporting Animal Emergencies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Contact local animal shelters or rescue organizations.'),
              Text('2. Use online platforms or social media to post information about lost pets.'),
              Text('3. Report animal emergencies to local authorities or animal control.'),
              Divider(),
              Text(
                'Tips for Pet Owners on Pet First Aid and Emergency Preparedness',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('1. Learn basic pet first aid techniques such as CPR and wound care.'),
              Text('2. Prepare an emergency kit for your pet with essentials such as food, water, and medication.'),
              Text('3. Have a plan in place for evacuating with your pet in case of emergencies.'),


              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Add functionality for the text field
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberLink(String label, String phoneNumber, Color labelColor, Color numberColor) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: labelColor),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: phoneNumber,
            style: TextStyle(color: numberColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _launchPhoneCall(phoneNumber);
              },
          ),
        ],
      ),
    );
  }



  _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
