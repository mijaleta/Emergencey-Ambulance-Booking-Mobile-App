import 'package:ambu_app/sidebar/NavBar.dart';
import 'package:flutter/material.dart';

class Nurse extends StatefulWidget {
  const Nurse({super.key});

  @override
  State<Nurse> createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Nurse',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
