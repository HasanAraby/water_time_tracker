import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';

class ContainerAmount extends StatelessWidget {
  const ContainerAmount(
      {super.key, required this.rqm, required this.isSelected});
  final int rqm;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey)),
      child: Center(
          child: Text(
        "${rqm}ml",
        style: AppFontStyles.big19(context).copyWith(
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      )),
    );
  }
}
