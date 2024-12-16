import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/view/widgets/customized_container.dart';
import 'package:water_time_tracker/view/widgets/upper_limit_dialog.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.date,
    required this.upperLimit,
  });
  final String date, upperLimit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          // change daily upper amount
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return UpperLimitDialog();
              },
            );
          },
          child: CustomizedContainer(
            horPadding: 8,
            verPadding: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Daily Goals',
                      style: AppFontStyles.small(context),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'ml $upperLimit',
                      style: AppFontStyles.small20(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Welcome',
              style: AppFontStyles.medium(context),
            ),
            Text(
              date,
              style: AppFontStyles.big(context),
            ),
          ],
        )
      ],
    );
  }
}
