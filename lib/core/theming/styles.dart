import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';

/// All Text Styles
class TextStyles {
  static TextStyle fontBlack = TextStyle(
    color: ColorsManager.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font22VeryDarkGrayWithOpacity = TextStyle(
    color: ColorsManager.dark.withValues(alpha: .7),
    fontSize: 22.sp,
  );

  static TextStyle font22VeryDarkGray = TextStyle(
    color: ColorsManager.dark,
    fontSize: 22.sp,
  );

  static TextStyle font26VeryDarkGray = TextStyle(
    color: ColorsManager.dark,
    fontSize: 26.sp,
    height: 1.2.h,
  );

  static TextStyle font22White = TextStyle(
    color: Colors.white,
    fontSize: 22.sp,
  );

  static TextStyle font22Black = TextStyle(
    color: ColorsManager.black,
    fontSize: 22.sp,
  );
}

class TextFormFieldBorders {
  static OutlineInputBorder focusedBorderForAppField = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.normal, width: 1.h),
    borderRadius: BorderRadius.circular(8.r),
  );

  static OutlineInputBorder enabledBorderForAppField = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.normal, width: 1.h),
    borderRadius: BorderRadius.circular(8.r),
  );

  static OutlineInputBorder errorBorderForAppField = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.h),
    borderRadius: BorderRadius.circular(8.r),
  );

  static OutlineInputBorder focusedBorderForPhoneField = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.normal, width: 1.h),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8.r),
      bottomRight: Radius.circular(8.r),
    ),
  );

  static OutlineInputBorder errorBorderForPhoneField = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.h),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8.r),
      bottomRight: Radius.circular(8.r),
    ),
  );

  static OutlineInputBorder stateBorderInCell = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(40.r),
  );

  static OutlineInputBorder stateBorderInForm = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(8.r),
  );
}
