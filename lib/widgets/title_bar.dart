import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  TitleBar({required this.actionName, required this.action});

  final String actionName;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Todo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: this.action,
          child: Text(
            this.actionName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
