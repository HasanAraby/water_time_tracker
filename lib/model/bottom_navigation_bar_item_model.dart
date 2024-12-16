import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';

class BottomNavigationBarItemModel {
  BottomNavigationBarItemModel({
    required this.iconData,
    this.label = '',
  });
  final IconData iconData;
  final String label;

  late Icon activeIcon = Icon(
    iconData,
    size: 45,
    color: AppColors.black,
  );
  late Icon inActiveIcon = Icon(
    iconData,
    size: 40,
    color: AppColors.grey,
  );
}
