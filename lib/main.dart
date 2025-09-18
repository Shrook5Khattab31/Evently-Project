import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appLanguageProvider.dart';
import 'package:evently_project/screens/homeScreen.dart';
import 'package:evently_project/screens/introScreen.dart';
import 'package:evently_project/screens/profileTab.dart';
import 'package:evently_project/utils/appThemes.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: EventlyApp(),
    )
  );
}
class EventlyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightAppTheme,
      darkTheme: AppThemes.darkAppTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RouteNames.introScreen,
      routes: {
        RouteNames.introScreen:(context) =>IntroScreen(),
        RouteNames.homeScreen:(context) =>HomeScreen(),
        RouteNames.profileScreen:(context) =>ProfileTab(),
      },
    );
  }
}
