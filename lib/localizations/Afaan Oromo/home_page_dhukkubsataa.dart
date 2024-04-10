import 'package:ambu_app/localizations/Afaan%20Oromo/home_service.dart';
import 'package:ambu_app/localizations/Amharic/yetamami_home_page.dart';
import 'package:ambu_app/localizations/classes/language.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/helpPage.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/home_page.dart';
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
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class HomePageDhukkubsataa extends StatefulWidget {
  const HomePageDhukkubsataa({super.key});

  @override
  _HomePageDhukkubsataaState createState() => _HomePageDhukkubsataaState();
}

class _HomePageDhukkubsataaState extends State<HomePageDhukkubsataa> {
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
    'Sirreeffama',
    'Konkolaachisaa',
    'Nurse',
    // 'Dispatcher',
    'Ba\'i\'',
    'Yaada',
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
        actions: <Widget>[
          // IconButton(
          //   icon: Image.asset("icons/notification-bell.png"),
          //   onPressed: () {},
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) {
                switch (language?.id) {
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const AmharicHomePage())));
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomePage())));
                    break;
                  // Add more cases for other languages if needed
                  case 3:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const HomePageDhukkubsataa())));
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
            child: Text(
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
              } else if (selectedMenuItem == 'Sirreeffama') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'Konkolaachisaa') {
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
              } else if (selectedMenuItem == 'Yaada') {
                // Handle Feedback navigation
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()));
              } else if (selectedMenuItem == 'Ba\'i\'') {
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
                  "Gargaarsa Ambulansii",
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
                  "Sirreeffama",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SettingsScreen()),
                  // )
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
                  "Gaafachuu",
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
                  "Imaammata",
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
                  "Gargaarsa",
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
                  "App dhiisi ba'i",
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
                'Gargaarsa Ambulaansii', // Add the text here
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
                  backgroundColor: Color.fromARGB(255, 72, 154, 220),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Ambulaansii Barbaaddaa?",
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
                  color: Color.fromARGB(255, 224, 96, 196),
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.2,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "Haalota murteessoo ta'an keessatti sarara jireenyaa kee ti, yeroo balaa tasaa deeggarsa barbaachisu waliin hatattamaan wal sin qunnamsiisna.",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Mallatteessuudhaan ykn gaaffii erguudhaan, Haala Tajaajilaa fi Imaammata Dhuunfaa keenya irratti walii galteetta.',
                    style: TextStyle(
                        fontSize: 14,
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
                          'Tajaajiloota',
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      const Text(
                        ' fi ',
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
                          'Ittiin bulmaata',
                          style: TextStyle(
                            color: Colors.yellow,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
