import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/config_font_size.dart';

class AppFontStyles {
  static TextStyle verySmall(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle small(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle small20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 20),
      fontWeight: FontWeight.w800,
      color: AppColors.black,
    );
  }

  static TextStyle medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 19),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle big(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 25),
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    );
  }

  static TextStyle big19(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 19),
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    );
  }

  static TextStyle veryBig(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 30),
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    );
  }
}
