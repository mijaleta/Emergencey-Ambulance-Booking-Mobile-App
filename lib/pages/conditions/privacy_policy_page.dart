import 'package:ambu_app/pages/conditions/legal_content.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    LegalContent privacyContent = LegalContent.privacyPolicyContent();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          privacyContent.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          child: Text(
            privacyContent.content,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
