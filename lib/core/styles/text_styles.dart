import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle style22() {
    return TextStyle(
      color: Colors.black,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style32( Color color) {
    return TextStyle(
      color: color,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style18(

  ) {
    return  TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }
    static TextStyle style20(

  ) {
    return  TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle style16Gray(

  ) {
    return  TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 97, 96, 96),
    );
  }
}
