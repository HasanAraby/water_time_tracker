import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/view/widgets/container_amount.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

class AmountsGridview extends StatelessWidget {
  AmountsGridview({super.key});
  final List<int> _items = [100, 200, 250, 300];
  // final int _cur = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterBloc, WaterState>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 25,
            mainAxisExtent: 50,
          ),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                BlocProvider.of<WaterBloc>(context)
                    .add(SelectWaterAmountEvent(selectedAmount: _items[i]));
              },
              child: ContainerAmount(
                  rqm: _items[i],
                  isSelected: _items[i] == state.selectedAmount),
            );
          },
        );
      },
    );
  }
}
