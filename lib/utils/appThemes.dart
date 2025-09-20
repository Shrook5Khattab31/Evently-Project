import 'package:flutter/material.dart';

import 'appColors.dart';
import 'appStyles.dart';

class AppThemes{
  static ThemeData lightAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightThemeColor,
    primaryColor: AppColors.primaryColor,
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
      bodyMedium: AppStyles.bold20black,
      bodySmall: AppStyles.medium16black,
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedLabelStyle: AppStyles.bold12offWhite,
      selectedItemColor: AppColors.offWhiteColor,
      unselectedLabelStyle: AppStyles.bold12offWhite,
      unselectedItemColor: AppColors.offWhiteColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent
    ),

    iconTheme: IconThemeData(
      color: AppColors.offWhiteColor,
      size: 24,
    ),
  );

  /// Dark Theme ///

  static ThemeData darkAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkThemeColor,
    primaryColor: AppColors.darkThemeColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
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

      bodyMedium: AppStyles.bold20offWhite,
      bodySmall: AppStyles.medium16offWhite,
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppColors.darkThemeColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppStyles.bold12offWhite,
      selectedItemColor: AppColors.offWhiteColor,
      unselectedLabelStyle: AppStyles.bold12offWhite,
      unselectedItemColor: AppColors.offWhiteColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent
    ),

    iconTheme: IconThemeData(
      color: AppColors.offWhiteColor,
      size: 24,
    ),
  );
}