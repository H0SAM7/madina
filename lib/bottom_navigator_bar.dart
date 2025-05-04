// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class BottomNavigator extends StatefulWidget {
//   const BottomNavigator({super.key});
//   static String id = 'BottomNavigator';

//   @override
//   State<BottomNavigator> createState() => _BottomNavigatorState();
// }

// class _BottomNavigatorState extends State<BottomNavigator> {
//   int _currentIndex = 0;

//   final List<Widget> _children = [
//     HomeView(),
//     ScanView(),
//     ChatbotScreen(),
//     SettingsView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: _children[_currentIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         height: 60.0,
//         items: [
//           Image.asset(
//             Assets.iconsHome,
//             color: Colors.black,
//             height: 35,
//           ),
//           Image.asset(
//             Assets.iconsScanning,
//             color:Colors.black,
//             height: 35,
//           ),
//           Image.asset(
//             Assets.iconsChatbot,
//             color: Colors.black,
//             height: 25,
//           ),
//           Image.asset(
//             Assets.iconsSetting,
//             color:Colors.black,
//             height: 35,
//           ),
//         ],
//         color: Colors.white,
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: Colors.transparent,
        
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }