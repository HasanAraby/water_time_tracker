import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';

class DummyWidget extends StatelessWidget {
  const DummyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'there is an error',
        style: AppFontStyles.veryBig(context),
      ),
    );
  }
}
