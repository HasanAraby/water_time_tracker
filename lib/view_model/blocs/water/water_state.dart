part of 'water_bloc.dart';

enum WaterStatus {
  Intial,
  UpperLimitEdited,
  WaterAmountAdded,
  SelectedAmountStatus
}

class WaterState {
  final WaterStatus waterStatus;
  final int? upperLimit, amountAdded, selectedAmount;
  final String? date;

  WaterState({
    this.waterStatus = WaterStatus.Intial,
    this.upperLimit = 200,
    this.amountAdded,
    this.selectedAmount = 0,
    this.date,
  });

  WaterState update({
    WaterStatus? newWaterStatus,
    int? newUpperLimit,
    int? newAmountAdded,
    int? newSelectedAmount,
    String? newDate,
  }) {
    return WaterState(
      waterStatus: newWaterStatus ?? waterStatus,
      upperLimit: newUpperLimit ?? upperLimit,
      amountAdded: newAmountAdded ?? amountAdded,
      selectedAmount: newSelectedAmount ?? selectedAmount,
      date: newDate ?? date,
    );
  }
}
