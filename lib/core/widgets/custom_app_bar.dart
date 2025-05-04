import 'package:flutter/material.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.widget, this.onTap});
  final String? title;
  final Widget? widget;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Image.asset(Assets.iconsBack,color: Colors.white,),
            ),
            const SizedBox(width: 20),
            title != null
                ? Text(
                    title!,
                    style: AppStyles.style18(context),
                  )
                : SizedBox(),
            const Spacer(),
            widget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
