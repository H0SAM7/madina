import 'package:flutter/material.dart';
import 'package:madina/core/widgets/custom_active_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  static String id = 'TestScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: StatusToggleButton(currentStatus: 'noactive', onStatusChanged: (v) async{}))],
      ),
    );
  }
}
