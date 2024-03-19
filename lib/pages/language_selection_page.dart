// ignore_for_file: prefer_const_constructors

import 'package:ambu_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'Select Language'; // Default language
  bool wantToChangeLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 80.0, 20.0, 20.0), // Added padding to add space
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Your Preferred Language',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedLanguage,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    onPressed: () {
                      _showLanguageMenu(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Selected Language: $selectedLanguage',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Do you want to change the language?'),
            ElevatedButton(
              onPressed: () {
                // Process language change logic here.
                // You can implement language change logic or navigate to another page for more options
              },
              child: const Text('Change'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                // Navigate to the next page based on selectedLanguage
                // _navigateToNextPage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.purple, // Set the background color to yellow
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showLanguageMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset.zero, ancestor: overlay),
          button.localToGlobal(button.size.bottomLeft(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      ),
      items: ['Select Language', 'English', 'Amharic', 'Afan Oromo']
          .map((String language) {
        return PopupMenuItem<String>(
          value: language,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              language,
              textAlign: TextAlign.right,
            ),
          ),
        );
      }).toList(),
    ).then((String? value) {
      if (value != null) {
        setState(() {
          selectedLanguage = value;
          wantToChangeLanguage = true; // User selected a language
        });
      }
    });
  }

  void _navigateToNextPage() {
    switch (selectedLanguage) {
      case 'English':
        // Navigator.pushReplacementNamed(context, '/home');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 'Amharic':
        // Navigate to the Amharic page
        break;
      case 'Afan Oromo':
        // Navigate to the Afan Oromo page
        break;
      default:
        // Navigate to some default page
        break;
    }
  }
}
