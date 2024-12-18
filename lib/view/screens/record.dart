import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/view/widgets/records_list_view.dart';
import 'package:water_time_tracker/view_model/blocs/navigation_and_database/screans_and_database_bloc.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  // List<RecordModel>? _records;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.recordBackground,
      appBar: AppBar(
        backgroundColor: AppColors.recordBackground,
        title: Text(
          'Record',
          style: AppFontStyles.big(context),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ScreansAndDatabaseBloc, ScreansAndDatabaseState>(
        builder: (context, state) {
          // print('in ui');
          // print(state.records![0].time);
          // print(state.records! == null);
          if (state.stateStatus == StateStatus.LoadingState) {
            return Center(
              child: Text(
                'Loading....',
                style: AppFontStyles.big(context),
              ),
            );
          } else if (state.records == null || state.records!.isEmpty) {
            return Center(
              child: Text(
                'You have not add any records yet!',
                style: AppFontStyles.big19(context),
              ),
            );
          } else {
            return RecordsListView(
              records: state.records!,
              water: 'water',
            );
          }
        },
      ),
    );
  }
}
