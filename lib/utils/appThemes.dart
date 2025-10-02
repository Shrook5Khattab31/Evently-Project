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
    cardColor: AppColors.blackColor,
    canvasColor: AppColors.lightBlueColor,

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
      titleTextStyle: AppStyles.regular22primary,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16lightBlue,
      headlineSmall: AppStyles.bold14primary,

      bodyMedium: AppStyles.bold20black,
      bodySmall: AppStyles.medium16black,

      displayMedium: AppStyles.medium16gray,
      displayLarge: AppStyles.bold16lightBlue,
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
    cardColor: AppColors.offWhiteColor,
    canvasColor: AppColors.offWhiteColor,

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
      titleTextStyle: AppStyles.regular22primary,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold24offWhite,
      headlineMedium: AppStyles.medium16offWhite,
      headlineSmall: AppStyles.bold14darkPrimary,

      bodyMedium: AppStyles.bold20offWhite,
      bodySmall: AppStyles.medium16offWhite,

      displayMedium: AppStyles.medium16offWhite,
      displayLarge: AppStyles.bold16darkPrimary,
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