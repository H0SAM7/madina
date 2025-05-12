import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/features/auth/manager/cubit/auth_cubit.dart';
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
          IconButton(
            onPressed: () async {
              await   BlocProvider.of<AuthCubit>(context).getUserProfile();
                // try {
                //   final token = await LocalStorage.getData('token');
                //   var headers = {
              
                //     'Authorization': 'Bearer $token',
                //   };
                //   var response = await ApiServices(dio: Dio()).getRequest(
                //     endPoint: '$loginBaseUrl/admin/user-profile',
                //     headers: headers,
                //   );
                //   log(response.toString());
                // } catch (e) {
                //   log(e.toString());
                // }
              
            },
            icon: Icon(Icons.import_contacts),
          ),
        ],
      ),
    );
  }
}
