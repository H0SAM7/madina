
// import 'package:flutter/material.dart';

// abstract class AppRoutes {
//   //     BottomNavigator
//   // BottomNavigator.id: (context) => const BottomNavigator(),

//   static String? initialRoute = SplashView.id;
  
//   static Map<String, Widget Function(BuildContext)> routes = {
//     BottomNavigator.id: (context) => const BottomNavigator(),
//     //navigation bar #########
    
//   };
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case HotelDetailsView.id:
//         final properties = settings.arguments as Properties;
//         return MaterialPageRoute(
//           builder: (context) => HotelDetailsView(hotel: properties),
//         );
//       case BookConfirmation.id:
//         final args = settings.arguments as Map<String, dynamic>;
//         final bookOrder = args['hotelBookModel'] as HotelBookModel;
//         final properties = args['properties'] as Properties;
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider(
//             create: (context) => PayMobCubit(),
//             child: BookConfirmation(
//               hotelBookModel: bookOrder,
//               hotel: properties,
//             ),
//           ),
//         );
      
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const Scaffold(
//             body: Center(
//               child: Text('Page Not Found'),
//             ),
//           ),
//         );
//     }
//   }
// }
