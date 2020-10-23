import 'package:flutter/material.dart';

class ApplicationTheme with ChangeNotifier {
  static bool _isDark = true;

  bool get isDark => _isDark;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    if (_isDark != isDark) {
      _isDark = isDark;
      notifyListeners();
    }
  }
}
