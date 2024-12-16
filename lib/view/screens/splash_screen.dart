import 'dart:async';

import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/core/navigation/navigation.dart';
import 'package:water_time_tracker/view/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.replace(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.recordBackground,
      body: Center(
        child: Text(
          'Time Tracking Water',
          style: AppFontStyles.veryBig(context),
        ),
      ),
    );
  }
}
