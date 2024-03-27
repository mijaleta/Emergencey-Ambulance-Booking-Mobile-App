// Assuming null safety is enabled (Dart SDK >= 2.12.0)

import 'package:flutter/material.dart';
import 'package:ambu_app/services/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press; // Use void Function() for callbacks

  const AlreadyHaveAnAccountCheck({
    Key? key, // Use nullable key
    required this.login, // Make login a required parameter
    required this.press, // Make press a required parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style:const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
