import 'package:flutter/material.dart';
import 'package:madina/core/utils/animation_routes.dart';
import 'package:madina/core/widgets/loading_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading & Route Example',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  void _navigate(BuildContext context, Route route) {
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Routes Example')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.route(TargetScreen()));
            },
            child: const Text('Slide from Right'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.routeBottom(TargetScreen()));
            },
            child: const Text('Slide from Bottom'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.routeBottomLeft(TargetScreen()));
            },
            child: const Text('Slide from Bottom Right'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.fadeRoute(TargetScreen()));
            },
            child: const Text('Fade Transition'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.scaleRoute(TargetScreen()));
            },
            child: const Text('Scale Transition'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.rotationRoute(TargetScreen()));
            },
            child: const Text('Rotation Transition'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.scaleFadeRoute(TargetScreen()));
            },
            child: const Text('Scale + Fade Transition'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.routeLeftToRight(TargetScreen()));
            },
            child: const Text('Slide from Left to Right'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.routeTopToBottom(TargetScreen()));
            },
            child: const Text('Slide from Top to Bottom'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.fancyZoomRotateFade(TargetScreen()));
            },
            child: const Text('Fancy Zoom Rotate Fade'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimationRoutes.flipHorizontalRoute(TargetScreen()));
            },
            child: const Text('Flip 3D Horizontal'),
          ),
            SizedBox(height: 30),
            Divider(),
            Text('Loading Widgets:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            LoadingWidgets.loadingCircles(),
            SizedBox(height: 10),
            LoadingWidgets.loadingdotsTriangle(),
            SizedBox(height: 10),
            LoadingWidgets.loadingprogressiveDots(),
            SizedBox(height: 20),
            Container(height: 150, child: LoadingWidgets.loadingthreeRotatingDots()),
          ],
        ),
      ),
    );
  }
}

class TargetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Target Page'),
      ),
      body: Center(
        child: Text(
          '🎯 Target Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}