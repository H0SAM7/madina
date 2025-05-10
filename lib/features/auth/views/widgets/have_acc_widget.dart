import 'package:flutter/material.dart';
import 'package:madina/constants.dart';

class HaveAccWidget extends StatelessWidget {
  const HaveAccWidget({
    super.key,
    required this.title,
    required this.action,
    this.onPressed,
  });
  final String title;
  final String action;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            title,
          
            style: TextStyle(color: Colors.black),
          ),
          Text(
            action,
            style: TextStyle(color: blueColor),
          ),
        ],
      ),
    );
  }
}
