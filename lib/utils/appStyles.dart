import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appColors.dart';

class AppStyles{
  ///--- White TextStyle (medium) ---///
  static TextStyle medium12white= GoogleFonts.inter(
    color: AppColors.lightThemeColor,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static TextStyle medium14white= GoogleFonts.inter(
    color: AppColors.lightThemeColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static TextStyle medium16white= GoogleFonts.inter(
    color: AppColors.lightThemeColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle regular20white= GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static TextStyle medium24white = GoogleFonts.inter(
    color: AppColors.lightThemeColor,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );
  static TextStyle medium36white= GoogleFonts.inter(
    color: AppColors.lightThemeColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  ///--- OffWhite TextStyle (medium) ---///
  static TextStyle medium16offWhite= GoogleFonts.inter(
    color: AppColors.offWhiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle medium20offWhite= GoogleFonts.inter(
    color: AppColors.offWhiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  ///--- OffWhite TextStyle (bold) ---///
  static TextStyle bold12offWhite= GoogleFonts.inter(
    color: AppColors.offWhiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static TextStyle bold20offWhite= GoogleFonts.inter(
    color: AppColors.offWhiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle bold24offWhite = GoogleFonts.inter(
    color: AppColors.offWhiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  ////////
  static TextStyle medium20primary= GoogleFonts.inter(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static TextStyle bold20primary= GoogleFonts.inter(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  ///////////
  static TextStyle medium16black= GoogleFonts.inter(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle bold20black= GoogleFonts.inter(
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}