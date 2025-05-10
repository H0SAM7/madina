import 'package:flutter/material.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/cities_list_view.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({super.key});
  static String id = 'CitiesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "المدن"),

          Expanded(child: CitiesListView()),
        ],
      ),
    );
  }
}
