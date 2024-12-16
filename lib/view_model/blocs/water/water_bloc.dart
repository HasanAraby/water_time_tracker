import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_time_tracker/core/constants/strings.dart';
import 'package:water_time_tracker/core/database/local_database.dart';
import 'package:water_time_tracker/core/functions/time.dart';
import 'package:water_time_tracker/core/functions/update_date_and_drunk_amount.dart';
import 'package:water_time_tracker/model/record_model.dart';

part 'water_event.dart';
part 'water_state.dart';

class WaterBloc extends Bloc<WaterEvent, WaterState> {
  final SharedPreferences sharedPrefs;
  final DbHelper dbHelper;
  WaterBloc({required this.dbHelper, required this.sharedPrefs})
      : super(WaterState(
          date: sharedPrefs.getString(AppStrings.date)!,
          upperLimit: sharedPrefs.getInt(AppStrings.upperLimit)!,
          amountAdded: sharedPrefs.getInt(AppStrings.drunkAmount)!,
        )) {
    on<WaterEvent>((event, emit) {
      int upperLimit, drunkAmount;
      String curDate;
      if (event is InitNumbersEvent) {
        if (sharedPrefs.getInt(AppStrings.upperLimit) == null) {
          sharedPrefs.setInt(AppStrings.upperLimit, 2000);
        }
        updateDateAndAmountDrunk(sharedPrefs);
        curDate = sharedPrefs.getString(AppStrings.date)!;
        upperLimit = sharedPrefs.getInt(AppStrings.upperLimit)!;
        drunkAmount = sharedPrefs.getInt(AppStrings.drunkAmount)!;
        emit(state.update(
            newWaterStatus: WaterStatus.Intial,
            newDate: curDate,
            newUpperLimit: upperLimit,
            newAmountAdded: drunkAmount));
      } else if (event is SetUpperLimitEvent) {
        updateDateAndAmountDrunk(sharedPrefs);
        sharedPrefs.setInt(AppStrings.upperLimit, event.upperLimit);
        curDate = sharedPrefs.getString(AppStrings.date)!;
        emit(state.update(
            newWaterStatus: WaterStatus.UpperLimitEdited,
            newDate: curDate,
            newUpperLimit: event.upperLimit));
      } else if (event is AddWaterAmountEvent) {
        updateDateAndAmountDrunk(sharedPrefs);
        int rqm =
            sharedPrefs.getInt(AppStrings.drunkAmount)! + event.addedAmount;
        sharedPrefs.setInt(AppStrings.drunkAmount, rqm);
        curDate = sharedPrefs.getString(AppStrings.date)!;
        if (event.addedAmount > 0) {
          String curTime = TimeHelper.getTime();
          dbHelper.insertRecord(RecordModel(
            amount: event.addedAmount,
            time: curTime,
            date: curDate,
          ));
        }
        emit(state.update(
            newWaterStatus: WaterStatus.WaterAmountAdded,
            newDate: curDate,
            newAmountAdded: rqm));
      } else if (event is SelectWaterAmountEvent) {
        emit(state.update(
          newWaterStatus: WaterStatus.SelectedAmountStatus,
          newSelectedAmount: event.selectedAmount,
        ));
      }
    });
  }
}
