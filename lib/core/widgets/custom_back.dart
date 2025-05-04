import 'package:flutter/material.dart';
import 'package:madina/core/utils/assets.dart';

// ignore: must_be_immutable
class CustomBack extends StatelessWidget {
  CustomBack({super.key, this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onPressed ??
                () {
                  Navigator.pop(context);
                },
            child: Image.asset(Assets.iconsBack,color: Colors.white,height: 22,),
          );
  }
}
