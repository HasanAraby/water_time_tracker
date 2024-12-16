import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_time_tracker/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.border,
      required this.textStyle,
      this.cursorColor,
      this.fillColor,
      this.hintText,
      required this.controller});
  final bool border;
  final TextStyle textStyle;
  final Color? cursorColor, fillColor;
  final String? hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      cursorColor: cursorColor,
      autofocus: true,
      decoration: InputDecoration(
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: border ? AppColors.primary : AppColors.transparent),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20, color: AppColors.grey),
      ),
      maxLength: 6,
      style: textStyle,
    );
  }
}
