import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  setTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}