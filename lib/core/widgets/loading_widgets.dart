import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:madina/constants.dart';

class LoadingWidgets {
  static Widget loadingCircles({double? size,Color? color}) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(
        size: size??100,
        color:color?? blueColor,
      ),
    );
  }

  static Widget loadingthreeRotatingDots({double? size}) {
    return Center(
      child: LoadingAnimationWidget.threeRotatingDots(
        size:size?? 100,
        color: blueColor,
      ),
    );
  }
static Widget loadingprogressiveDots({double? size}) {

    return Center(
      child: LoadingAnimationWidget.progressiveDots(
        size:size?? 100,
        color: blueColor,
      ),
    );
  }

static Widget loadingdotsTriangle({double? size}) {
    return Center(
      child: LoadingAnimationWidget.dotsTriangle(
        size:size?? 100,
        color: blueColor,
      ),
    );
  }
}
