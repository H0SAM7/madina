import 'package:flutter/material.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/features/auth/views/register_view.dart';
import 'package:madina/splash.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/presentation/views/add_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/add_city_view.dart';
import 'package:madina/users/super_admin/presentation/views/add_trip_view.dart';
import 'package:madina/users/super_admin/presentation/views/admin_view.dart';
import 'package:madina/users/super_admin/presentation/views/branch_details_view.dart';
import 'package:madina/users/super_admin/presentation/views/branchs_view.dart';
import 'package:madina/users/super_admin/presentation/views/cities_mangment_view.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';
import 'package:madina/users/super_admin/presentation/views/edit_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/edit_city_view.dart';

import '../../z/test_screen.dart';

abstract class AppRoutes {
  //     BottomNavigator
  // BottomNavigator.id: (context) => const BottomNavigator(),


  static String? initialRoute =  AdminView.id;
  
  static Map<String, Widget Function(BuildContext)> routes = {
 //   BottomNavigator.id: (context) => const BottomNavigator(),
      TestScreen.id: (context) => const TestScreen(),

      AdminView.id: (context) => const AdminView(),



      LoginView.id: (context) => const LoginView(),
      RegisterView.id: (context) => const RegisterView(),
     CitiesMangmentView.id: (context) => const CitiesMangmentView(),

     AddCity.id: (context) => const AddCity(),
     CitiesView.id: (context) => const CitiesView(),

     AddTripView.id: (context) => const AddTripView(),
     SplashView.id: (context) => const SplashView(),
     EditCityView.id: (context) => const EditCityView(),
     EditBranchView.id: (context) => const EditBranchView(),

    //navigation bar #########
    
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
           case BranchsView.id:
        final cityModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BranchsView(cityModel: cityModel as CityModel),
        );
 case AddBranchView.id:
        final cityModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => AddBranchView(cityModel: cityModel as CityModel),
        );
         case BranchDetailsView.id:
        final branchModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BranchDetailsView(branchModel: branchModel as BranchModel),
        );
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


