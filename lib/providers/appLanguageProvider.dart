import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage='en';
  void changeLanguage(BuildContext context,String newLanguage){
    if(appLanguage==newLanguage) return;
    appLanguage=newLanguage;
    if (newLanguage == 'ar') {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
    notifyListeners();
  }
}
