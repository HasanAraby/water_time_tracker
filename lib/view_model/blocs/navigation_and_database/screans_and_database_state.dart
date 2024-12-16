part of 'screans_and_database_bloc.dart';

enum StateStatus {
  DeletedAllRecords,
  ReadAllRecords,
  DeletedIdRecord,
  ChangedScreen,
  LoadingState,
}

class ScreansAndDatabaseState {
  final StateStatus? stateStatus;
  final int? screenIndex;
  final List<RecordModel>? records;

  ScreansAndDatabaseState(
      {this.stateStatus, this.screenIndex = 0, this.records});

  ScreansAndDatabaseState updatde({
    StateStatus? newStateStatus,
    int? newScreenIndex,
    List<RecordModel>? newRecords,
  }) {
    return ScreansAndDatabaseState(
      records: newRecords ?? records,
      screenIndex: newScreenIndex ?? screenIndex,
      stateStatus: newStateStatus ?? stateStatus,
    );
  }
}
