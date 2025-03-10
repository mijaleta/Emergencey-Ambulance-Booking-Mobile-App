import 'package:ambu_app/pages/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:flutter/services.dart'; // Import for precacheImage

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Pre-load the splash screen image and the main page
    final Future<MainPage> futureMainPage = Future.delayed(
      const Duration(seconds: 2), // Adjust delay as needed
          () => MainPage(),
    );
    // Pre-load the splash screen image
    Future<void> precacheImage(AssetImage asset) async {
      await precacheImage(asset); // Only the asset image is required
    }

    precacheImage(const AssetImage('assets/unsplash.png'));  // Replace with your image path

    // Navigation logic here to navigate to the language selection page first
    Future.delayed(const Duration(seconds: 3), () { // Reduced delay (optional)
      Navigator.pushReplacementNamed(context, '/mainPage');
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/unsplash.png'), // Pre-loaded image
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
