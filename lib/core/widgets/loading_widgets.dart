import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:madina/constants.dart';
import 'package:shimmer/shimmer.dart';
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
  static Widget flicker({double? size}) {
    return Center(
      child: LoadingAnimationWidget.flickr(
        size:size?? 100,
        leftDotColor: blueColor, rightDotColor: const Color(0xFFEA3799),
      ),
    );
  }
  static Widget customShimmer({double? width, double? height, Color? baseColor, Color? highlightColor}) {
    return Container(
      width: width ?? 200,
      height: height ?? 100,
      decoration: BoxDecoration(
        color: baseColor ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor ?? Colors.grey[300]!,
                highlightColor ?? Colors.grey[100]!,
                baseColor ?? Colors.grey[300]!,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
