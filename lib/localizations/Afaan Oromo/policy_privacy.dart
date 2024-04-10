import 'package:flutter/material.dart';

import 'contenti_seeraa.dart';

class OromoPrivacyPolicyPage extends StatelessWidget {
  const OromoPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    OromoLegalContent privacyContent = OromoLegalContent.privacyPolicyContent();
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
