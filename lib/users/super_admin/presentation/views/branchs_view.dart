import 'package:flutter/material.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/branch_card.dart';

class BranchsView extends StatelessWidget {
  const BranchsView({super.key});
  static String id = 'BranchsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomAppBar(title: 'الفروع'), BranchCard(index: 1)],
      ),
    );
  }
}
