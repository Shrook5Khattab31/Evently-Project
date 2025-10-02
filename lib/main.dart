import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appLanguageProvider.dart';
import 'package:evently_project/providers/appThemeProvider.dart';
import 'package:evently_project/screens/auth/loginScreen.dart';
import 'package:evently_project/screens/auth/registerScreen.dart';
import 'package:evently_project/screens/auth/resetPasswordScreen.dart';
import 'package:evently_project/screens/createEventsScreen.dart';
import 'package:evently_project/screens/homeScreen.dart';
import 'package:evently_project/screens/introScreen.dart';
import 'package:evently_project/screens/onBoardingScreen.dart';
import 'package:evently_project/screens/tabs/profileTab/profileTab.dart';
import 'package:evently_project/utils/appThemes.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AppLanguageProvider()),
        ChangeNotifierProvider(create: (context)=> AppThemeProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: EventlyApp(),
      ),
    )
  );
}
class EventlyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightAppTheme,
      darkTheme: AppThemes.darkAppTheme,
      themeMode: themeProvider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RouteNames.homeScreen,
      routes: {
        RouteNames.onBoardingScreen:(context) =>OnBoardingScreen(),
        RouteNames.introScreen:(context) =>IntroScreen(),
        RouteNames.loginScreen:(context) =>LoginScreen(),
        RouteNames.registerScreen:(context) => RegisterScreen(),
        RouteNames.resetPasswordScreen:(context) => ResetPasswordScreen(),
        RouteNames.homeScreen:(context) =>HomeScreen(),
        RouteNames.createEventsScreen:(context) =>CreateEventsScreen(),
      },
    );
  }
}
