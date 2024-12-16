import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.complete});
  final double complete;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width - 50 - 60;

    return SizedBox(
      width: width,
      height: 5,
      child: Stack(
        children: [
          Container(
            color: AppColors.sliderBackground,
          ),
          Container(
            width: width * complete,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
