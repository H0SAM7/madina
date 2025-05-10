import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.widget, this.onTap, this.isPop});
  final String? title;
  final Widget? widget;
  final void Function()? onTap;
  final bool? isPop;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
          (isPop!=true) ? GestureDetector(
              onTap:
                  onTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Transform.rotate(
                angle: 3.14159,
                child: Image.asset(Assets.iconsBack, color: Colors.black,height: 24.h,width: 24.w,),
              ),
            ):SizedBox(),
          
             SizedBox(width: 30.w),
            title != null
                ? Text(title!, style: AppStyles.style22())
                : SizedBox(),
            const Spacer(),
            widget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
