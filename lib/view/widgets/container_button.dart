import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton(
      {super.key,
      this.height,
      this.width,
      this.margin,
      this.borderRadius,
      required this.textStyle,
      required this.onTap});
  final double? height, width, margin, borderRadius;
  final TextStyle textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (onTap),
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          'OK',
          style: textStyle.copyWith(color: AppColors.white),
        )),
      ),
    );
  }
}
