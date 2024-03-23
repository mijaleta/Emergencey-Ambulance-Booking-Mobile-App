import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
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
      ),
      body: const Center(
        child: Text(
          'Read this Policies Here',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
      ),
    );
  }
}
