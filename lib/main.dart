import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appLanguageProvider.dart';
import 'package:evently_project/providers/appThemeProvider.dart';
import 'package:evently_project/providers/appEventProvider.dart';
import 'package:evently_project/screens/auth/loginScreen.dart';
import 'package:evently_project/screens/auth/registerScreen.dart';
import 'package:evently_project/screens/auth/resetPasswordScreen.dart';
import 'package:evently_project/screens/eventCreation/createEventsScreen.dart';
import 'package:evently_project/screens/homeScreen.dart';
import 'package:evently_project/screens/introScreen.dart';
import 'package:evently_project/screens/onBoardingScreen.dart';
import 'package:evently_project/utils/appThemes.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AppLanguageProvider()),
        ChangeNotifierProvider(create: (context)=> AppThemeProvider()),
        ChangeNotifierProvider(create: (context)=> AppEventProvider()),
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
      initialRoute: RouteNames.loginScreen,
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
