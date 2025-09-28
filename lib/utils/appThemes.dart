import 'package:flutter/material.dart';

import 'appColors.dart';
import 'appStyles.dart';

class AppThemes{
  static ThemeData lightAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBlueColor,
    primaryColor: AppColors.primaryColor,
    focusColor: AppColors.lightBlueColor,
    dividerColor: AppColors.grayColor,
    disabledColor: AppColors.grayColor,

    tabBarTheme:  TabBarThemeData(
      unselectedLabelStyle: AppStyles.medium16lightBlue,
      labelStyle: AppStyles.medium16primary,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: AppColors.lightBlueColor,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
        side: BorderSide(color: AppColors.lightBlueColor,width: 4,),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBlueColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16lightBlue,

      bodyMedium: AppStyles.bold20black,
      bodySmall: AppStyles.medium16black,

      displayMedium: AppStyles.medium16gray,
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
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
    primaryColor: AppColors.darkPrimaryColor,
    focusColor: AppColors.primaryColor,
    dividerColor: AppColors.primaryColor,
    disabledColor: AppColors.offWhiteColor,

    tabBarTheme:  TabBarThemeData(
      unselectedLabelStyle: AppStyles.medium16offWhite,
      labelStyle: AppStyles.medium16offWhite,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: AppColors.primaryColor,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
        side: BorderSide(color: AppColors.lightBlueColor,width: 4,),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16offWhite,

      bodyMedium: AppStyles.bold20offWhite,
      bodySmall: AppStyles.medium16offWhite,

      displayMedium: AppStyles.medium16offWhite,
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppColors.darkPrimaryColor,
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