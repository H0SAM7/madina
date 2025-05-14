import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/views/add_city_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/cities_list_view.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({super.key});
  static String id = 'CitiesView';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "المدن",
            widget: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddCity.id);
              },
              icon: Icon(Icons.add, size: 25.w,color: blue2,),
            ),
          ),

          Expanded(child: CitiesListView()),
        ],
      ),
    );
  }
}
