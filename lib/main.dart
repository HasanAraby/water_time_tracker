import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/dependency_injection/dependency_injection.dart';
import 'package:water_time_tracker/view/screens/splash_screen.dart';
import 'package:water_time_tracker/view_model/blocs/navigation_and_database/screans_and_database_bloc.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WaterBloc>(
            create: (c) => di<WaterBloc>()..add(InitNumbersEvent())),
        BlocProvider<ScreansAndDatabaseBloc>(
            create: (c) => di<ScreansAndDatabaseBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
