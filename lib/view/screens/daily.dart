import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/functions/compute_percent.dart';
import 'package:water_time_tracker/view/widgets/add_water_amount.dart';
import 'package:water_time_tracker/view/widgets/header_widget.dart';
import 'package:water_time_tracker/view/widgets/statistics_widget.dart';
import 'package:water_time_tracker/view/widgets/wave_progress_indicator.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

class Daily extends StatelessWidget {
  const Daily({super.key});
  @override
  // GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key,
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(right: 28, left: 28, top: 28),
        child: ListView(
          children: [
            BlocBuilder<WaterBloc, WaterState>(
              builder: (context, state) {
                return HeaderWidget(
                  upperLimit: state.upperLimit.toString(),
                  date: state.date!,
                );
              },
            ),
            const SizedBox(height: 50),
            BlocBuilder<WaterBloc, WaterState>(
              builder: (context, state) {
                return StatisticsWidget(
                  upperLimit: state.upperLimit!,
                  drunkTillNow: state.amountAdded!,
                );
              },
            ),
            const SizedBox(height: 50),
            BlocBuilder<WaterBloc, WaterState>(
              builder: (context, state) {
                return WaveProgressIndicator(
                    progress:
                        computePercent(state.upperLimit!, state.amountAdded!) *
                            100);
              },
            ),
            const SizedBox(height: 50),
            AddWaterAmount(),
          ],
        ),
      ),
    );
  }
}
