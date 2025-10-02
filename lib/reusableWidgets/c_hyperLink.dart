import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/appColors.dart';

typedef OnPressed=void Function();
class C_hyperLink extends StatelessWidget {
  String text;
  OnPressed onPressed;
  AlignmentGeometry? alignment;
  bool isItalic;
  FontWeight? fontWeight;
  bool isUnderlined;
  C_hyperLink({required this.text,
    required this.onPressed,
    this.alignment,
    this.isItalic=false,
    this.fontWeight,
    this.isUnderlined=false,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment??AlignmentDirectional.center,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.primaryColor,
              fontStyle: isItalic?FontStyle.italic:null,
              fontWeight: fontWeight??FontWeight.bold,
              fontSize: 16,
              decoration: isUnderlined?TextDecoration.underline:null,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ).tr()
      ),
    );
  }
}
