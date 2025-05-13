import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/manager/cubit/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/add_city_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/cities_list_view.dart';

class CitiesView extends StatefulWidget {
  const CitiesView({super.key});
  static String id = 'CitiesView';

  @override
  State<CitiesView> createState() => _CitiesViewState();
}

class _CitiesViewState extends State<CitiesView> {
  @override
  void initState() {
    fetchCities();
    super.initState();
  }

  void fetchCities() async {
    await BlocProvider.of<SuperAdminCubit>(context).getCities(token: temptoken);
  }

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
              icon: Icon(Icons.add, size: 25.w),
            ),
          ),

          Expanded(child: CitiesListView()),
        ],
      ),
    );
  }
}
