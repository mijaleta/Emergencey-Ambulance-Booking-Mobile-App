import 'package:ambu_app/widgets/forward_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkSettingSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function(bool value) onTap;
  final bool value;
  const DarkSettingSwitch(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.iconColor,
      required this.icon,
      required this.onTap,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              // Ionicons.earth,
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            // "Language",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const Spacer(),
          Text(
            value ? "On" : "Off",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          // ForwardButton(
          //   onTap: () {},
          // )
          CupertinoSwitch(value: value, onChanged: onTap)
        ],
      ),
    );
  }
}
