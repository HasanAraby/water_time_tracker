import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_time_tracker/core/database/local_database.dart';
import 'package:water_time_tracker/model/record_model.dart';

part 'screans_and_database_event.dart';
part 'screans_and_database_state.dart';

class ScreansAndDatabaseBloc
    extends Bloc<ScreansAndDatabaseEvent, ScreansAndDatabaseState> {
  final DbHelper dbHelper;
  final SharedPreferences sharedPrefs;
  ScreansAndDatabaseBloc({required this.sharedPrefs, required this.dbHelper})
      : super(ScreansAndDatabaseState()) {
    on<ScreansAndDatabaseEvent>((event, emit) async {
      if (event is ChangeScreenEvent) {
        emit(state.updatde(
          newStateStatus: StateStatus.ChangedScreen,
          newScreenIndex: event.screenIndex,
        ));
      } else if (event is ReadAllRecordsEvent) {
        List? records;
        List<RecordModel>? items;
        emit(state.updatde(newStateStatus: StateStatus.LoadingState));
        records = await dbHelper.readRecords();
        if (records != null) {
          items = records.map((e) => RecordModel().fromJson(e)).toList();
        }
        emit(state.updatde(
            newStateStatus: StateStatus.ReadAllRecords, newRecords: items));
        // print(items![0].time);
        // print(items[1].time);
      } else if (event is DeleteAllRecordsEvent) {
        emit(state.updatde(newStateStatus: StateStatus.LoadingState));

        await dbHelper.deleteAll();
        emit(state.updatde(
          newStateStatus: StateStatus.DeletedAllRecords,
        ));
      } else if (event is DeleteRecordEvent) {
        emit(state.updatde(newStateStatus: StateStatus.LoadingState));

        await dbHelper.deleteRecord(event.id);

        List? records;
        List<RecordModel>? items;
        emit(state.updatde(newStateStatus: StateStatus.LoadingState));
        records = await dbHelper.readRecords();
        if (records != null) {
          items = records.map((e) => RecordModel().fromJson(e)).toList();
        }
        emit(state.updatde(
          newStateStatus: StateStatus.DeletedIdRecord,
          newRecords: items,
        ));
      }
    });
  }
}
