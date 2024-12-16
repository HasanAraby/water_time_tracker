part of 'water_bloc.dart';

sealed class WaterEvent extends Equatable {
  const WaterEvent();

  @override
  List<Object> get props => [];
}

// calc upperlimit, drunk amount if new day reset amount
class InitNumbersEvent extends WaterEvent {}

class SetUpperLimitEvent extends WaterEvent {
  final int upperLimit;

  const SetUpperLimitEvent({required this.upperLimit});
  @override
  List<Object> get props => [upperLimit];
}

class AddWaterAmountEvent extends WaterEvent {
  final int addedAmount;

  const AddWaterAmountEvent({required this.addedAmount});
  @override
  List<Object> get props => [addedAmount];
}

class SelectWaterAmountEvent extends WaterEvent {
  final int selectedAmount;

  const SelectWaterAmountEvent({required this.selectedAmount});
  @override
  List<Object> get props => [selectedAmount];
}
