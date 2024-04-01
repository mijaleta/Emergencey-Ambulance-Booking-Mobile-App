import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FAQItem(
                question: 'How do I book an ambulance?',
                answer:
                    'You can book an ambulance by navigating to the "Book Ambulance" section of the app and following the prompts to provide necessary details.',
              ),
              FAQItem(
                question:
                    'How do I request emergency assistance through the app?',
                answer:
                    'In case of an emergency, open the app and navigate to the "Emergency Assistance" section. Fill out the required forms with all the details about the emergency situation and submit it. Our system will dispatch an ambulance to your location based on the information provided. Ensure your phone number is up-to-date in your profile for tracking purposes.',
              ),
              FAQItem(
                question: 'How can I track my ambulance?',
                answer:
                    'Once you have booked an ambulance, you can track its location in real-time using our app. Simply go to the "Track Ambulance" section and enter your booking details.',
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'For any further assistance or inquiries, please feel free to contact our support team at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Phone: (+251) 961-5788',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Text(
                  'Email: support@ambulanceapp.com',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            answer,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
