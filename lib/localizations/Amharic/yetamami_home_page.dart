import 'package:ambu_app/localizations/Amharic/yeprivacy_policy.dart';
import 'package:ambu_app/localizations/classes/language.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ionicons/ionicons.dart';

import '../../pages/navpages/main_page.dart';
import '../Afaan Oromo/oromifa_main.dart';
import 'HTypeSelection/htypeselection.dart';
import 'agalgilot_term.dart';
import 'amarigna_main.dart';
import 'habeshasidebar/hsidebar.dart';

class AmharicHomePage extends StatefulWidget {
  const AmharicHomePage({super.key});

  @override
  _AmharicHomePageState createState() => _AmharicHomePageState();
}

class _AmharicHomePageState extends State<AmharicHomePage> {
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
    // 'መለያ',
    // 'Search',
    // 'ቅንብሮች',
    // 'ሹፌር',
    // 'ነርስ',
    // 'Dispatcher',
    // 'ውጣ',
    'ግብረ መልስ',
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
              icon: const Text(
                'A/OROMO',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24), // Style the text as needed
              ),
              onChanged: (Language? language) {
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
              'ግባ',
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
              if (selectedMenuItem == 'መለያ') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              } else if (selectedMenuItem == 'ቅንብሮች') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
                // Handle settings navigation
              } else if (selectedMenuItem == 'ሹፌር') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Driver()),
                // );
                // Handle settings navigation
              } else if (selectedMenuItem == 'ነርስ') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Nurse()),
                );
              } else if (selectedMenuItem == 'ግብረ መልስ') {
                // Handle Feedback navigation
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()));
              } else if (selectedMenuItem == 'ውጣ') {
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
      drawer: HSideBar(),
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
                'አምቡላንስ ቦታ ማስያዝ', // Add the text here
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
                          builder: (context) => HEmergencyTypeSelectionPage()));
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
                    "አምቡላንስ ያዙ",
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
                  color: Color.fromARGB(124, 119, 11, 220),
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.2,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "በአስቸጋሪ ሁኔታዎች ውስጥ የህይወት መስመርዎን፣ በድንገተኛ ጊዜ ከሚያስፈልጉት ድጋፍ ጋር በፍጥነት ያገናኘዎታል።",
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
                    'በመመዝገብ ወይም ጥያቄ በመላክ፣ በእኛ የአገልግሎት ውል እና የግላዊነት መመሪያ ተስማምተሃል።',
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
                                    const AmharicTermsOfServicePage()),
                          );
                        },
                        child: const Text(
                          'የአገልግሎት ውል',
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Text(
                        ' እና ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AmharicPrivacyPolicyPage()));
                        },
                        child: const Text(
                          'የ ግል ፖሊሲ',
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
