import 'package:flutter/material.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(88, 208, 204, 204),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
