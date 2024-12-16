import 'package:water_time_tracker/core/constants/strings.dart';

class RecordModel {
  int? amount, id;
  String? time, date;

  RecordModel({this.id, this.amount, this.time, this.date});

  RecordModel fromJson(Map<String, dynamic> record) {
    return RecordModel(
      id: id = record[AppStrings.id],
      amount: amount = record[AppStrings.amount],
      time: time = record[AppStrings.time],
      date: time = record[AppStrings.date],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.id: id,
      AppStrings.time: time,
      AppStrings.amount: amount,
      AppStrings.date: date,
    };
  }
}
