import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:flutter/material.dart';
import '../utils/appColors.dart';
import '../utils/appStyles.dart';

class C_elevatedButton extends StatelessWidget {
  OnPressed onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? borderColor;
  Widget? child;
  EdgeInsets? padding;
  C_elevatedButton({
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.padding,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor??AppColors.primaryColor,
        padding: padding??EdgeInsets.symmetric(vertical: height*0.019),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(color: borderColor??Colors.transparent),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: child!,
          ),
        ],
      ),
    );
  }
}
