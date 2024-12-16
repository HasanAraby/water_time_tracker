import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/core/functions/app_dimensions.dart';
import 'package:water_time_tracker/core/navigation/navigation.dart';
import 'package:water_time_tracker/view/widgets/amounts_gridview.dart';
import 'package:water_time_tracker/view/widgets/container_button.dart';
import 'package:water_time_tracker/view/widgets/custom_text_field.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

class AddWaterAmount extends StatelessWidget {
  AddWaterAmount({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: getHeight(context) * .5,
                  child: ListView(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ML',
                            style: AppFontStyles.big19(context),
                          ),
                          const Spacer(),
                          SizedBox(
                            // height: 100,
                            width: 150,
                            child: BlocBuilder<WaterBloc, WaterState>(
                              builder: (context, state) {
                                if (state.waterStatus ==
                                    WaterStatus.SelectedAmountStatus) {
                                  _controller.text =
                                      state.selectedAmount.toString();
                                } else {
                                  _controller.text = '';
                                }
                                return CustomTextField(
                                  controller: _controller,
                                  border: false,
                                  textStyle: AppFontStyles.big19(context),
                                  hintText: 'Please enter',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.grey,
                        thickness: 2,
                      ),
                      const SizedBox(height: 40),
                      AmountsGridview(),
                      const SizedBox(height: 35),
                      ContainerButton(
                          height: 60,
                          textStyle: AppFontStyles.medium(context)
                              .copyWith(fontSize: 22),
                          onTap: () {
                            BlocProvider.of<WaterBloc>(context).add(
                                AddWaterAmountEvent(
                                    addedAmount: _controller.text == ''
                                        ? 0
                                        : int.parse(_controller.text)));
                            context.pop();
                          }),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              );
            });
      },
      child: Icon(
        Icons.add_circle,
        size: 90,
        color: AppColors.primary,
      ),
    );
  }
}
