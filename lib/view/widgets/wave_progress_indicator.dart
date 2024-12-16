import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:wave_loading_indicator/wave_progress.dart';

class WaveProgressIndicator extends StatelessWidget {
  const WaveProgressIndicator({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return WaveProgress(
      size: 350,
      borderColor: AppColors.primary,
      borderSize: 1,
      foregroundWaveColor: AppColors.primary,
      progress: progress,
      innerPadding: 0,
    );
  }
}
