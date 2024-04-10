import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation logic here to navigate to the language selection page first
    Future.delayed(const Duration(seconds: 13), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image widget
            // Image.asset(
            //   'assets/splash.jpg',
            //   fit: BoxFit.cover,
            //   alignment: Alignment.center,
            // ),
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
        ),
      ),
    );
  }
}
