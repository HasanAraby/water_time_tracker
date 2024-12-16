import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_time_tracker/core/constants/strings.dart';
import 'package:water_time_tracker/core/functions/time.dart';

void updateDateAndAmountDrunk(SharedPreferences sharedPrefs) {
  String curDate = TimeHelper.getDate();
  //  intialize cachedDate
  if (sharedPrefs.getString(AppStrings.date) == null) {
    sharedPrefs.setString(AppStrings.date, curDate);
  }

  String cachedDate = sharedPrefs.getString(AppStrings.date)!;
  //  intialize cached upperlimit
  if (sharedPrefs.getInt(AppStrings.upperLimit) == null) {
    sharedPrefs.setInt(AppStrings.upperLimit, 2000);
  }

  //  intialize cached drunkAmount
  if (sharedPrefs.getInt(AppStrings.drunkAmount) == null) {
    sharedPrefs.setInt(AppStrings.drunkAmount, 0);
  }

  //  update date and reset drunk amount
  if (cachedDate != curDate) {
    sharedPrefs.setString(AppStrings.date, curDate);
    sharedPrefs.setInt(AppStrings.drunkAmount, 0);
  }
}
