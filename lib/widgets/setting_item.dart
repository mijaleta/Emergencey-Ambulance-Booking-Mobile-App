// ignore_for_file: prefer_const_constructors

import 'package:ambu_app/widgets/forward_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.shade200,
            ),
            child: Icon(
              Ionicons.earth,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Language",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            "English",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ForwardButton()
        ],
      ),
    );
  }
}
