import 'package:flutter/material.dart';

class AnimationRoutes {
  static Route route(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Route routeBottom(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Route routeBottomLeft(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
 static Route fadeRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Route scaleRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: Curves.easeInOut));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route rotationRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }

  static Route scaleFadeRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var scaleTween = Tween(begin: 0.9, end: 1.0).chain(CurveTween(curve: Curves.easeOut));
        var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeOut));

        return FadeTransition(
          opacity: animation.drive(fadeTween),
          child: ScaleTransition(
            scale: animation.drive(scaleTween),
            child: child,
          ),
        );
      },
    );
  }

  
// 1. Slide from Left to Right
static Route routeLeftToRight(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

// 2. Slide from Top to Bottom
static Route routeTopToBottom(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, -1.0);
      var end = Offset.zero;
      var curve = Curves.easeOutCubic;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

// 3. Fade + Scale + Rotate (for dramatic entry)
static Route fancyZoomRotateFade(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn));
      var scaleTween = Tween(begin: 0.7, end: 1.0).chain(CurveTween(curve: Curves.easeOutBack));
      var rotateTween = Tween(begin: -0.05, end: 0.0);

      return FadeTransition(
        opacity: animation.drive(fadeTween),
        child: ScaleTransition(
          scale: animation.drive(scaleTween),
          child: RotationTransition(
            turns: animation.drive(rotateTween),
            child: child,
          ),
        ),
      );
    },
  );
}

// 4. 3D Flip Animation (horizontal)
static Route flipHorizontalRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final rotate = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );

      return AnimatedBuilder(
        animation: rotate,
        builder: (context, child) {
          final angle = rotate.value * 3.14; // pi radians (180 degrees)
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: child,
          );
        },
        child: child,
      );
    },
  );
}
  
  
}
