import 'package:ambu_app/sidebar/NavBar.dart';
import 'package:flutter/material.dart';

class Dispatcher extends StatefulWidget {
  const Dispatcher({super.key});

  @override
  State<Dispatcher> createState() => _DipatcherState();
}

class _DipatcherState extends State<Dispatcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Dispatcher',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
