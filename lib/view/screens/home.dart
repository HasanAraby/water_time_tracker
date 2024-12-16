import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/model/bottom_navigation_bar_item_model.dart';
import 'package:water_time_tracker/view/screens/daily.dart';
import 'package:water_time_tracker/view/screens/record.dart';
import 'package:water_time_tracker/view_model/blocs/navigation_and_database/screans_and_database_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _Screens = [
    const Daily(),
    const Records(),
  ];

  final List<BottomNavigationBarItemModel> _items = [
    BottomNavigationBarItemModel(iconData: Icons.water_drop_outlined),
    BottomNavigationBarItemModel(iconData: Icons.pending_actions_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreansAndDatabaseBloc, ScreansAndDatabaseState>(
      builder: (context, state) {
        return Scaffold(
          body: _Screens.elementAt(state.screenIndex!),
          bottomNavigationBar: BottomNavigationBar(
            items: _items
                .map(
                  (e) => BottomNavigationBarItem(
                    // icon: Icon(Icons.water),
                    icon: e.inActiveIcon,
                    label: e.label,
                    activeIcon: e.activeIcon,
                  ),
                )
                .toList(),
            currentIndex: state.screenIndex!,
            onTap: (e) {
              BlocProvider.of<ScreansAndDatabaseBloc>(context)
                  .add(ChangeScreenEvent(screenIndex: e));
              if (e == 1) {
                BlocProvider.of<ScreansAndDatabaseBloc>(context)
                    .add(ReadAllRecordsEvent());
              }
            },
          ),
        );
      },
    );
  }
}
