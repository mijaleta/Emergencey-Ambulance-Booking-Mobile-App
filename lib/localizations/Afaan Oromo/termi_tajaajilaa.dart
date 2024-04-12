import 'package:flutter/material.dart';

import 'contenti_seeraa.dart';

class OromoTermsOfServicePage extends StatelessWidget {
  const OromoTermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    OromoLegalContent termsContent = OromoLegalContent.termsOfServiceContent();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          termsContent.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          child: Text(
            termsContent.content,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
