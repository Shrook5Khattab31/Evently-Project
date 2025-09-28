import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:flutter/material.dart';

class C_textFormField extends StatelessWidget {
  String hintText;
  Color borderColor;
  Color? prefixIconColor;
  Color? suffixIconColor;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  C_textFormField({
    required this.hintText,
    this.borderColor=AppColors.grayColor,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText.tr(),
        hintStyle: hintStyle??Theme.of(context).textTheme.displayMedium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: prefixIconColor??Theme.of(context).disabledColor,
        suffixIconColor: suffixIconColor??Theme.of(context).disabledColor,
        enabledBorder: buildBorderDecoration(Theme.of(context).dividerColor),
        focusedBorder: buildBorderDecoration(Theme.of(context).dividerColor),
        errorBorder: buildBorderDecoration(AppColors.redColor),
      ),
    );
  }
  OutlineInputBorder buildBorderDecoration(Color borderColor){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }
}
