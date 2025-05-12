
import 'package:flutter/material.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/features/auth/views/register_view.dart';
import 'package:madina/splash.dart';
import 'package:madina/users/super_admin/presentation/views/add_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/add_city_view.dart';
import 'package:madina/users/super_admin/presentation/views/add_trip_view.dart';
import 'package:madina/users/super_admin/presentation/views/branchs_view.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),


  static String? initialRoute =  AddCity.id;
  
  static Map<String, Widget Function(BuildContext)> routes = {
 //   BottomNavigator.id: (context) => const BottomNavigator(),
      LoginView.id: (context) => const LoginView(),
      RegisterView.id: (context) => const RegisterView(),

     AddCity.id: (context) => const AddCity(),
     AddBranchView.id: (context) => const AddBranchView(),
     CitiesView.id: (context) => const CitiesView(),
     BranchsView.id: (context) => const BranchsView(),
     AddTripView.id: (context) => const AddTripView(),
     SplashView.id: (context) => const SplashView(),

    //navigation bar #########
    
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case HotelDetailsView.id:
      //   final properties = settings.arguments as Properties;
      //   return MaterialPageRoute(
      //     builder: (context) => HotelDetailsView(hotel: properties),
      //   );
      // case BookConfirmation.id:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final bookOrder = args['hotelBookModel'] as HotelBookModel;
      //   final properties = args['properties'] as Properties;
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => PayMobCubit(),
      //       child: BookConfirmation(
      //         hotelBookModel: bookOrder,
      //         hotel: properties,
      //       ),
      //     ),
      //   );
      
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          ),
        );
    }
  }
}
