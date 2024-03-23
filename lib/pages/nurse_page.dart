import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NursePage extends StatefulWidget {
  const NursePage({super.key});

  @override
  State<NursePage> createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Ionicons.chevron_back_outline)),
        title: const Text('Nurse Screen'),
      ),
      body: const Center(
        child: Text(
          'Nurse Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
