// import 'package:flutter/material.dart';
// import 'package:ambu_app/pages/signup_page.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Login',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/ambu.jpg'), // Adjust the image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Email TextFormField
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   filled: true,
//                   fillColor: Colors.grey[200], // Grey background color
//                   border: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.circular(40.0), // Rounded corners
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 15.0,
//                     horizontal: 20.0,
//                   ), // Adjusted content padding
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 10.0), // Adjusted margin between fields

//               // Password TextFormField
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   filled: true,
//                   fillColor: Colors.grey[200], // Grey background color
//                   border: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.circular(40.0), // Rounded corners
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 15.0,
//                     horizontal: 20.0,
//                   ), // Adjusted content padding
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20.0),

//               // Login button
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Login functionality
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 20.0),

//               // Or sign in with social media
//               const Text(
//                 'Or sign in with social media',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 10.0),

//               // Google and Facebook login buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Image.asset(
//                       'icons/google.png',
//                       width: 40,
//                       height: 40,
//                     ),
//                     onPressed: () {
//                       // Implement Google login
//                     },
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       'icons/facebook.png',
//                       width: 40,
//                       height: 40,
//                     ),
//                     onPressed: () {
//                       // Implement Facebook login
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),

//               // Don't have an account? Create Account button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an account? ",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 15,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to the signup page when "Create Account" is pressed
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => SignupPage()),
//                       );
//                     },
//                     child: const Text(
//                       'Register',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 10, 245, 18),
//                         fontSize: 15,
//                         // backgroundColor: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
