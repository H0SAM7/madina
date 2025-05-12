import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    String? token = await LocalStorage.getData("token");
    if (token == null || await isTokenExpired(token)) {
      Navigator.pushReplacementNamed(context, LoginView.id);
    } else {
      Navigator.pushReplacementNamed(context, CitiesView.id);
    }
  }
  Future<bool> isTokenExpired(String token) async {
    if (JwtDecoder.isExpired(token)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   Assets.imagesLogo,
            // ),
            const SizedBox(height: 30),
            LoadingWidgets.flicker(size: 60, ),
          ],
        ),
      ),
    );
  }
}
