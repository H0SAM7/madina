import 'package:flutter/material.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.color,
    this.onTap,
    this.width, this.txtColor,
  });
  final String title;
  final Color? color;
    final Color? txtColor;

  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? 300,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? orangeColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: AppStyles.style16Gray(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:txtColor?? Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
