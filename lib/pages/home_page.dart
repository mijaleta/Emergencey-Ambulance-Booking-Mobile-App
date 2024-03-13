import 'package:flutter/material.dart';
import 'package:ambu_app/pages/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Image.asset(
            "images/menu.png",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: null, // Remove the title
        actions: [
          IconButton(
            icon: Image.asset("images/notification-bell.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("images/user-icon.png"),
            onPressed: () {
              setState(() {
                _isLoading = true; // Set loading state to true
              });

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

              // Delay navigation for 2 seconds
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _isLoading = false; // Set loading state to false
                });
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Home Page'), // Home Page Implementation
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.transparent,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
