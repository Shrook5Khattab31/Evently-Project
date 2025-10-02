import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:flutter/material.dart';

class C_textFormField extends StatelessWidget {
  String hintText;
  Color? borderColor;
  Color? prefixIconColor;
  Color? suffixIconColor;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  TextEditingController? controller;
  C_textFormField({
    required this.hintText,
    this.controller,
    this.borderColor,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (text){
        if(text ==null || text.trim().isEmpty){
          return 'Please enter the information required';
        }
        return null;
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText.tr(),
        hintStyle: hintStyle??Theme.of(context).textTheme.displayMedium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: prefixIconColor??Theme.of(context).disabledColor,
        suffixIconColor: suffixIconColor??Theme.of(context).disabledColor,
        enabledBorder: buildBorderDecoration(borderColor??Theme.of(context).dividerColor),
        focusedBorder: buildBorderDecoration(borderColor??Theme.of(context).dividerColor),
        focusedErrorBorder: buildBorderDecoration(AppColors.redColor),
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
