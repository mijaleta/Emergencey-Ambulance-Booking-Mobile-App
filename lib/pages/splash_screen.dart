import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:flutter/services.dart'; // Import for precacheImage

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Pre-load the splash screen image
    Future<void> precacheImage(AssetImage asset) async {
      await precacheImage(asset); // Only the asset image is required
    }

    precacheImage(const AssetImage('assets/unsplash.jpg'));  // Replace with your image path

    // Navigation logic here to navigate to the language selection page first
    Future.delayed(const Duration(seconds: 7), () { // Reduced delay (optional)
      Navigator.pushReplacementNamed(context, '/mainPage');
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/unsplash.jpg'), // Pre-loaded image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image widget (pre-loaded)
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
