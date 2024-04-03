import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  const EditItem({
    super.key,
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: widget,
        ),
      ],
    );
  }
}
