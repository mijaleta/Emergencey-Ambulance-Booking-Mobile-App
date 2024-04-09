import 'package:ambu_app/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Home'),
    Text('Home'),
  ];

  void _onItemTap(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
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
      //                   builder: (context) => const OurServices()),
      //             );
      //             break;
      //           case 2: // Navigate to Search page
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const AmbulanceSearchPage()),
      //             );
      //             break;
      //           case 3: // Navigate to Settings page
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const OurServices()),
      //             );
      //             break;

      //           default:
      //             break;
      //         }
      //       },
      //       tabs: const [
      //         GButton(
      //           icon: Icons.home,
      //           text: 'Home',
      //         ),
      //         GButton(
      //           icon: Icons.medical_services_outlined,
      //           text: 'Services',
      //         ),
      //         GButton(
      //           icon: Icons.search,
      //           text: 'Search',
      //         ),
      //         GButton(
      //           icon: Icons.settings,
      //           text: 'Settings',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: const Color.fromARGB(255, 122, 77, 198),
      //   color: Color.fromARGB(255, 156, 108, 245),
      //   animationDuration: Duration(microseconds: 300),
      //   onTap: (index) {},
      //   items: const [
      //     Icon(
      //       Icons.home,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.medical_services,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.search,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.settings,
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
    );
  }
}
