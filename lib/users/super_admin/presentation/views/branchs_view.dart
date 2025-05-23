import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/presentation/manager/cities/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/add_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/branch_list_view.dart';

class BranchsView extends StatelessWidget {
  const BranchsView({super.key, required this.cityModel});
  static const String id = 'BranchsView';

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'الفروع',
            widget: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AddBranchView.id,
                  arguments: cityModel,
                );
              },
              icon: Icon(Icons.add, size: 25.w, color: blue2),
            ),
          ),

          Expanded(child: BranchListView()),
        ],
      ),
    );
  }
}
