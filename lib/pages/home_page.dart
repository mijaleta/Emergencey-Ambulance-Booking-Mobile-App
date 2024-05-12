import 'package:ambu_app/localizations/classes/language.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/navpages/main_page.dart';
import 'package:ambu_app/sidebar/general_sidebar.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ionicons/ionicons.dart';

import '../localizations/Afaan Oromo/oromifa_main.dart';
import '../localizations/Amharic/amarigna_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of image URLs
  final List<String> imageUrls = [
    'assets/ambu-blue.jpg',
    'assets/ambu-keyboard.jpg',
    'assets/stockambulance.jpg',
    'assets/stockphoto1.jpg',
    'assets/stockphoto2.jpg',
    'assets/specialist-female-doctor-copy-space.jpg',
    'assets/stockphoto1.jpg',
    'assets/ambulance-8496603_1280.png',
    'assets/blue-light-73088_1280.jpg',
    'assets/doctor-1010903_1280.jpg',
    'assets/pexels-artem-saranin-1853537.jpg',
    'assets/pexels-pavel-danilyuk-6754173.jpg',
    'assets/pexels-pixabay-263402.jpg',
    'assets/pexels-rdne-stock-project-6520084.jpg',
    'assets/pexels-run-ffwpu-2486541.jpg',
  ];
  // Dropdown menu items
  final List<String> dropdownItems = [
    'Account',
    // 'Search',
    'Settings',
    // 'Driver',
    'Nurse',
    // 'Dispatcher',
    'Logout',
    'Feedback',
  ];
  String? selectedMenuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonSideBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Ionicons.menu_outline),
            // IconButton.styleFrom(colo),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Image.asset("icons/notification-bell.png"),
          //   onPressed: () {},
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Text(
                'አማርኛ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24), // Style the text as needed
              ),
              onChanged: (Language? language) {
                // Navigate to the selected page based on the language
                switch (language?.id) {
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const AmarignaMainPage())));
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const MainPage())));
                    break;
                  // Add more cases for other languages if needed
                  case 3:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const OromiffaMainPage())));
                    break;
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          TextButton(
            onPressed: () {
              // Navigate to your login screen
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text(
              'Login',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),

          PopupMenuButton(
            icon: Image.asset("icons/more.png"),
            onSelected: (String value) {
              // Update the selectedMenuItem variable
              setState(() {
                selectedMenuItem = value;
              });
              // Handle menu item selection here
              if (selectedMenuItem == 'Account') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              } else if (selectedMenuItem == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const SettingPage()),
                // );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Driver') {
                // Navigator.push(
                //   // context,
                //   // MaterialPageRoute(builder: (context) => const Driver()),
                // );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Nurse') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Nurse()),
                );
              } else if (selectedMenuItem == 'Feedback') {
                // Handle Feedback navigation
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const FeedbackPage()));
              } else if (selectedMenuItem == 'Logout') {
                // Handle logout navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const Logout()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return dropdownItems.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/back3.jpg"), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0), // Add padding around the content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Ambulance Booking', // Add the text here
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300.0,
                width: double.infinity,
                child: CarouselSlider(
                  items: imageUrls.map((imageUrl) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin:const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval:const Duration(seconds: 2),
                    autoPlayAnimationDuration:const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 1.0,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergencyTypeSelectionPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 72, 154, 220),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:const EdgeInsets.all(7),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Book Ambulance",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color:const Color.fromARGB(124, 119, 11, 220),
                  padding:const EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.2,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "It's your lifeline in critical situations, connecting you promptly to the support needed during emergencies.",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'By signing up or sending request, you agree to our Terms of Service and Privacy Policy.',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TermsOfServicePage()),
                          );
                        },
                        child: const Text(
                          'Terms of Service',
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Text(
                        ' and ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PrivacyPolicyPage()));
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.yellow,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
