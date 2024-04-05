import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/helpPage.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/hospital_page.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/policies.dart';
import 'package:ambu_app/pages/setting.dart';
import 'package:ambu_app/users/dispatcher.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_search_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

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
    'Search',
    'Settings',
    'Driver',
    'Nurse',
    'Dispatcher',
    'Logout',
    'Feedback',
  ];
  String? selectedMenuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Ionicons.menu_outline),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Image.asset("icons/notification-bell.png"),
          //   onPressed: () {},
          // ),
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
              } else if (selectedMenuItem == 'Search') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AmbulanceSearchPage()),
                );
              } else if (selectedMenuItem == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Driver') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Driver()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Nurse') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Nurse()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Dispatcher') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dispatcher()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Feedback') {
                // Handle Feedback navigation
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()));
              } else if (selectedMenuItem == 'Logout') {
                // Handle logout navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Logout()),
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
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(
              255, 83, 82, 82), // Set drawer background color
          padding: EdgeInsets.only(top: 100.0),
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  "Book",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold), // Set text color
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DriverPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(
                    left: 20.0), // Remove ListTile default padding
                horizontalTitleGap: 5, // Remove space between icon and text
                leading: const Icon(
                  Icons.book,
                  color: Colors.white, // Set icon color
                ),
              ),
              ListTile(
                title: const Text(
                  "History",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HospitalPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(
                    left: 20.0), // Remove ListTile default padding
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Ambulance Types",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AmbulanceSearchPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.directions_car,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Request",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientRequestPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.request_page,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Policies",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.policy,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Help",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  "Exit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => History()),
                  // )
                },
                contentPadding: const EdgeInsets.only(left: 20.0),
                horizontalTitleGap: 5,
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
                      margin: EdgeInsets.symmetric(horizontal: 10),
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
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
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
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Book Ambulance",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Color.fromARGB(255, 139, 18, 113),
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.2,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "It's your lifeline in critical situations, connecting you promptly to the support needed during emergencies.",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // New containers as requested
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        "Choose what you need",
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          "Emergency",
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/dog-with-first-aid-kit-bag.png',
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Accessibility",
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
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/first-aid-box.png',
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "First Aid",
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/medical1.png',
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Accident",
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
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
                    "Login",
                    style: TextStyle(fontSize: 18),
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
