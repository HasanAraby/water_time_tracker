part of 'screans_and_database_bloc.dart';

sealed class ScreansAndDatabaseEvent extends Equatable {
  const ScreansAndDatabaseEvent();

  @override
  List<Object> get props => [];
}

class ChangeScreenEvent extends ScreansAndDatabaseEvent {
  final int screenIndex;

  const ChangeScreenEvent({required this.screenIndex});
  @override
  List<Object> get props => [screenIndex];
}

class ReadAllRecordsEvent extends ScreansAndDatabaseEvent {}

class DeleteAllRecordsEvent extends ScreansAndDatabaseEvent {}

class DeleteRecordEvent extends ScreansAndDatabaseEvent {
  final int id;

  const DeleteRecordEvent({required this.id});
  @override
  List<Object> get props => [id];
}
