import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:flutter/material.dart';
import '../utils/appColors.dart';
import '../utils/appStyles.dart';

class C_elevatedButton extends StatelessWidget {
  OnPressed onPressed;
  String text;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? borderColor;
  Widget? prefixIcon;
  C_elevatedButton({required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor??AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(color: borderColor??Colors.transparent),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon != null ? Row(
            children: [
              prefixIcon!,
              const SizedBox(width: 8),
            ],
          ) : const SizedBox.shrink(),
          Text(text,style: textStyle??AppStyles.medium20offWhite,).tr(),
        ],
      ),
    );
  }
}
