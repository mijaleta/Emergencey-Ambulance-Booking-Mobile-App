import 'package:ambu_app/pages/ambulance_search_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/services/acceessiblity.dart';
import 'package:ambu_app/services/accident.dart';
import 'package:ambu_app/services/emergency.dart';
import 'package:ambu_app/services/first_aid.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class YegnaAgalgilot extends StatelessWidget {
  const YegnaAgalgilot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'አገልግሎቶች',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/back3.jpg"), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: Text(
                  'የምንሰጣቸው አገልግሎቶች',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                const Center(
                  child: Text(
                    "ምን ይፋልጋሉ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.all(10.0), // Increased padding
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 5, 71),
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Emergency()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/emergency-call.png',
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                          height:
                                              20), // Adjusted padding between icon and text
                                      const Text(
                                        "ድንገተኛ አደጋ?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Accessibility()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/dog-with-first-aid-kit-bag.png',
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "ተደራሽነት",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FirstAid()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/first-aid-box.png',
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "የመጀመሪያ እርዳታ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Accident()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/medical1.png',
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "አደጋ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Colors.grey.shade800,
      //       gap: 8,
      //       padding: const EdgeInsets.all(16),
      //       onTabChange: (index) {
      //         switch (index) {
      //           case 0: // Navigate to Home page
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => HomePage()),
      //             );
      //             break;
      //           case 1: // Navigate to Services page
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const YegnaAgalgilot()),
      //             );
      //             break;
      //           case 2: // Navigate to Search page
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(
      //             //       builder: (context) => const AmbulanceSearchPage()),
      //             // );
      //             break;
      //           case 3: // Navigate to Settings page
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const YegnaAgalgilot()),
      //             );
      //             break;

      //           default:
      //             break;
      //         }
      //       },
      //       tabs: const [
      //         GButton(
      //           icon: Icons.home,
      //           text: 'መነሻ ገጽ',
      //         ),
      //         GButton(
      //           icon: Icons.medical_services_outlined,
      //           text: 'አገልግሎቶች',
      //         ),
      //         GButton(
      //           icon: Icons.search,
      //           text: 'ፈልግ',
      //         ),
      //         GButton(
      //           icon: Icons.settings,
      //           text: 'ቅንብሮች',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
