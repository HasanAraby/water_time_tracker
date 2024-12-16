import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';

class CustomizedContainer extends StatelessWidget {
  const CustomizedContainer(
      {super.key,
      required this.child,
      required this.verPadding,
      required this.horPadding});
  final Widget child;
  final double verPadding, horPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horPadding,
        vertical: verPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
