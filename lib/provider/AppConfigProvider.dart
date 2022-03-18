import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String language = 'en';
  ThemeMode mode = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (newLanguage == language) return;
    language = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == mode) return;
    mode = newTheme;
    notifyListeners();
  }
}
