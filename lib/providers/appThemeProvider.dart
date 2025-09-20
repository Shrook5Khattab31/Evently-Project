import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  String appTheme = 'light';

  void changeTheme(String newTheme) {
    if (appTheme == newTheme) return;
    appTheme = newTheme;
    notifyListeners();
  }
  ThemeMode get themeMode {
    if (appTheme == 'dark') return ThemeMode.dark;
    return ThemeMode.light;
  }
}
