import 'package:flutter/material.dart';

import 'appColors.dart';
import 'appStyles.dart';

class AppThemes{
  static ThemeData lightAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightThemeColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
        side: BorderSide(color: AppColors.lightThemeColor,width: 4,),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(80)),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16offWhite,
      headlineSmall: AppStyles.bold12offWhite,
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppColors.primaryColor,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: AppColors.offWhiteColor,
      size: 24,
    ),
  );

  /// Dark Theme ///

  static ThemeData darkAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkThemeColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
        side: BorderSide(color: AppColors.lightThemeColor,width: 4,),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(80)),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16offWhite,
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppColors.darkThemeColor,
      elevation: 0,
    ),
  );
}