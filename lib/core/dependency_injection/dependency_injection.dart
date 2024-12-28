import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_time_tracker/core/database/local_database.dart';
import 'package:water_time_tracker/core/functions/update_date_and_drunk_amount.dart';
import 'package:water_time_tracker/view_model/blocs/navigation_and_database/screans_and_database_bloc.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

final di = GetIt.instance;

Future<void> initDependencyInjection() async {
  DbHelper dbHelper = DbHelper();
  di.registerLazySingleton<DbHelper>(() => dbHelper);
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  // reset
  // sharedPrefs.setInt(AppStrings.drunkAmount, 0);
  // sharedPrefs.setInt(AppStrings.upperLimit, 2000);
  // dbHelper.deleteAll();
  di.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  updateDateAndAmountDrunk(sharedPrefs);
  // print("============");
  // print(sharedPrefs.getInt(AppStrings.upperLimit));
  di.registerFactory<WaterBloc>(
      () => WaterBloc(sharedPrefs: di(), dbHelper: di()));
  di.registerFactory<ScreansAndDatabaseBloc>(
      () => ScreansAndDatabaseBloc(dbHelper: di(), sharedPrefs: di()));
}
