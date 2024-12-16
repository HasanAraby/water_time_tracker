import 'dart:math';

import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/core/functions/compute_percent.dart';
import 'package:water_time_tracker/view/widgets/custom_slider.dart';
import 'package:water_time_tracker/view/widgets/customized_container.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
    required this.upperLimit,
    required this.drunkTillNow,
  });
  final int upperLimit, drunkTillNow;

  @override
  Widget build(BuildContext context) {
    print('upp $upperLimit,  drnk $drunkTillNow--------------'); //////////
    return CustomizedContainer(
      horPadding: 30,
      verPadding: 10,
      child: Column(
        children: [
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "${drunkTillNow}ML",
              style: AppFontStyles.veryBig(context),
            ),
          ),
          const SizedBox(height: 15),
          CustomSlider(complete: computePercent(upperLimit, drunkTillNow)),
          const SizedBox(height: 10),
          Row(
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "Remaining ",
                  style: AppFontStyles.verySmall(context),
                ),
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "${max(0, upperLimit - drunkTillNow)}ml",
                  style: AppFontStyles.verySmall(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "%${(computePercent(upperLimit, drunkTillNow) * 100).toStringAsFixed(2)}",
                  style: AppFontStyles.verySmall(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  " Completed",
                  style: AppFontStyles.verySmall(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
