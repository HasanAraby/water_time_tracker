import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';
import 'package:water_time_tracker/core/constants/app_font_styles.dart';
import 'package:water_time_tracker/core/navigation/navigation.dart';
import 'package:water_time_tracker/view/widgets/container_button.dart';
import 'package:water_time_tracker/view/widgets/custom_text_field.dart';
import 'package:water_time_tracker/view_model/blocs/water/water_bloc.dart';

class UpperLimitDialog extends StatelessWidget {
  UpperLimitDialog({super.key});
  final TextEditingController _upperLimitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Daily Goals',
        style: AppFontStyles.big19(context),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _upperLimitController,
            border: true,
            textStyle: AppFontStyles.big19(context),
            cursorColor: AppColors.primary,
            fillColor: AppColors.whiteGrey,
          ),
          const SizedBox(height: 30),
          // ok button
          ContainerButton(
            height: 40,
            width: 80,
            textStyle: AppFontStyles.medium(context),
            onTap: () {
              if (_upperLimitController.text != '') {
                BlocProvider.of<WaterBloc>(context).add(SetUpperLimitEvent(
                    upperLimit: int.parse(_upperLimitController.text)));
              }
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
