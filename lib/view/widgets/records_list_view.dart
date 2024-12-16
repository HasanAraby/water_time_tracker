import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/model/record_model.dart';
import 'package:water_time_tracker/view_model/blocs/navigation_and_database/screans_and_database_bloc.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

class RecordsListView extends StatelessWidget {
  const RecordsListView({
    super.key,
    required this.water,
    required this.records,
  });
  final String water;
  final List<RecordModel> records;

  @override
  Widget build(BuildContext context) {
    List<RecordModel> revRecords = records.reversed.toList();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: revRecords.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              index == 0 ||
                      (index > 0 &&
                          revRecords[index].date != revRecords[index - 1].date)
                  ? Text(
                      revRecords[index].date!,
                      style: AppFontStyles.big(context),
                    )
                  : const SizedBox(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  tileColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: AppColors.primary,
                      )),
                  leading: IntrinsicWidth(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<WaterBloc>(context).add(
                                AddWaterAmountEvent(
                                    addedAmount: -revRecords[index].amount!));
                            BlocProvider.of<ScreansAndDatabaseBloc>(context)
                                .add(DeleteRecordEvent(
                                    id: revRecords[index].id!));
                            revRecords.removeAt(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 1),
                        Text(
                          '${revRecords[index].amount}ML',
                          style: AppFontStyles.small20(context),
                        ),
                      ],
                    ),
                  ),
                  trailing: IntrinsicWidth(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              water,
                              style: AppFontStyles.small(context),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              revRecords[index].time!,
                              style: AppFontStyles.verySmall(context)
                                  .copyWith(color: AppColors.grey),
                            )
                          ],
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          Icons.water_drop,
                          size: 40,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
