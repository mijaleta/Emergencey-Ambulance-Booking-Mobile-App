import 'package:ambu_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

  Future<void> _sendPasswordResetEmail(BuildContext context) async {
    final String email = emailController.text;
    final url = Uri.parse('http://192.168.137.210:3000/forgot-password');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
        }),
      );
      final responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody['success']) {
        // Navigate to the success page
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to send password reset email: ${responseBody['message']}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      // try {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Error: $e')),
      //   );
      // } catch (e) {
      //   print('Failed to show SnackBar: $e');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Reset Your Password",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(16.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _sendPasswordResetEmail(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SuccessScreen
class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            Text(
              'Password reset email sent!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Replace the current screen with the login screen
                // Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child:const Text(
                'Back to Login',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
