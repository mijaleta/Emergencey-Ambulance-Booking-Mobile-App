import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation logic here to navigate to the language selection page first
    Future.delayed(const Duration(seconds: 20), () {
      Navigator.pushReplacementNamed(context, '/languageSelection');
    });

    return Scaffold(
      // backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text(
      //     'Welcome Back,',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image widget
          Image.asset(
            'assets/splash.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          // overflow: Overflow.visible,

          // Your other widgets like logo, loading animation, etc.
          // Example:
          // Center(
          //   child: CircularProgressIndicator(), // Loading animation
          // ),
          // LinearProgressIndicator(
          //   backgroundColor: Colors.grey,
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          // )
          // Shimmer.fromColors(
          //   baseColor: Colors.grey[300],
          //   highlightColor: Colors.grey[100],
          //   child: Container(
          //     width: 200.0,
          //     height: 100.0,
          //     color: Colors.white,
          //   ),
          // )
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.blue,
              child: const Center(
                child: Text(
                  'Emergency Ambulance Booking',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        // child: Image(
        //   image: AssetImage('assets/splash.jpg'),
        // ),
        // mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        // CircularProgressIndicator(
        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        // ),
        // SizedBox(height: 20),
        // Text(
        //   'Ambulance Booking',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // ],
      ),
    );
  }
}
