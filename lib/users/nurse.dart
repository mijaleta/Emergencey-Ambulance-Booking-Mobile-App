import 'package:ambu_app/sidebar/NavBar.dart';
import 'package:flutter/material.dart';

import '../sidebar/nurse_navbar.dart';

class Nurse extends StatefulWidget {
  const Nurse({super.key});

  @override
  State<Nurse> createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NurseNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Nurse',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              children: [
                Text("Weakly Schedule", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),),
                SizedBox(width: 70,),
                Text("History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),),
              ],
            ),
            const SizedBox(height: 40,),

            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/allocate-t.png", )
            ),
          ],
        ),
      ),
    );
  }
}
