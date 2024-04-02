import 'package:ambu_app/sidebar/NavBar.dart';
import 'package:flutter/material.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Driver',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
