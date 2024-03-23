import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

class RegisterAmbulance extends StatefulWidget {
  const RegisterAmbulance({super.key});

  @override
  State<RegisterAmbulance> createState() => _RegisterAmbulanceState();
}

class _RegisterAmbulanceState extends State<RegisterAmbulance> {
  bool _isGPSEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(),
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              const SizedBox(
                height: 20,
              ),
              _inputField(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "REGISTER AMBULANCE",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 164, 152, 44)),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Ambulance ID",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            // prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Registration Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.password_rounded),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Ambulance Type",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.password_rounded),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Seating Capacity",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.password_rounded),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Ambulance Status",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.password_rounded),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Expanded(
              child: Text(
                'GPS Integration',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Switch(
              value: _isGPSEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _isGPSEnabled = newValue;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text(
              "Attach Document",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Login()));
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ).copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Browse",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   "Attach Document",
            //   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            // ),
            // ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(vertical: 12),
            //       backgroundColor: Colors.transparent,
            //     ),
            //     child: const Text(
            //       "Browse",
            //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //     ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
