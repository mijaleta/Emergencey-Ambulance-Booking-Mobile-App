import 'package:flutter/material.dart';

class Accident extends StatefulWidget {
  const Accident({super.key});

  @override
  State<Accident> createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Accident',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ambu-phone.png')),
        ),
        child: const Text('Accident Page', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
