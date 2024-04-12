import 'package:flutter/material.dart';

import 'higawi_content.dart';

class AmharicPrivacyPolicyPage extends StatelessWidget {
  const AmharicPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    AmharicLegalContent privacyContent =
        AmharicLegalContent.privacyPolicyContent();
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
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
