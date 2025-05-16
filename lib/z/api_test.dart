import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/repos/super_repo_impl.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Places App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlaceListScreen(),
    );
  }
}

class PlaceListScreen extends StatelessWidget {
  final ApiServices apiServices = ApiServices(dio: Dio());
  Future<bool> isTokenExpired(String token) async {
    if (JwtDecoder.isExpired(token)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: IconButton(
              onPressed: () async {
                final result = await apiServices.postRequest(
                  endPoint: '$baseUrl/admin/update/title/15',
                  headers: {'Authorization': 'Bearer $temptoken'},
                  // data: {"name": name},
                );
                log('job updated$result');

                // final Map<String, dynamic>
                // result = await apiServices.getRequest(
                //   endPoint:
                //       'https://almadinah.zaha-script.net/api/admin/showAll/city',
                //   headers: {'Authorization': 'Bearer $temptoken'},
                // );

                // final data = result['data'] as List<dynamic>?;

                // if (data == null) {
                //   data [];
                // }

                // data != null
                //     ? data
                //         .map(
                //           (cityJson) => CityModel.fromJson(
                //             cityJson as Map<String, dynamic>,
                //           ),
                //         )
                //         .toList()
                //     : [];
                // log(data.toString());
              },
              icon: Icon(Icons.ac_unit_outlined, size: 60),
            ),
          ),
        ],
      ),
    );
  }
}
