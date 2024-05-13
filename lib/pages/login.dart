import 'package:ambu_app/pages/change_password.dart';
import 'package:ambu_app/pages/forgot_password_page.dart';
import 'package:ambu_app/pages/admin_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // body: SingleChildScrollView(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: EdgeInsets.only(top: 100, bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header(context),
                SizedBox(height: 50,),
                _inputField(context),
                SizedBox(height: 50,),
                _forgotPassword(context),
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "Enter your credentials to login",
        ),
      ],
    );
  }

  _inputField(context) {
// chnaged here
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    Future<void> _submitLogin() async {
      if (_formKey.currentState!.validate()) {
      final String username = usernameController.text;
      final String password = passwordController.text;
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

      final url =
          Uri.parse('http://ambulance-website.samiintegratedfarm.com/login');
      // final url = Uri.parse('http://192.168.0.65:3000/login');

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            'username': username,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          final responseBody = json.decode(response.body);
          if (responseBody['success']) {
            // Handle successful login (e.g., store session cookie)
            SharedPreferences prefs = await SharedPreferences.getInstance();
// Store the username in SharedPreferences
            await prefs.setString('username', responseBody['user']['username']);

            // Example:
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              switch (responseBody['user']['role']) {
                case 'admin':
                  return AdminPage();
                case 'driver':
                  // return Driver(); // Pass the driver's name here
                  return Driver(username: responseBody['user']['username']);

                case 'nurse':
                  return const Nurse();
                // Add other roles here
                default:
                  return const Scaffold(
                    body: Center(child: Text('Unauthorized')),
                  );
              }
            }));
          } else {
            print('Login failed: ${responseBody['message']}');
          }
        } else {
          print('Login failed with status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
      
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.password_rounded),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: _submitLogin,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue,
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
      child: Text(
        'Forgot Password',
      ),
    );
  }
}
