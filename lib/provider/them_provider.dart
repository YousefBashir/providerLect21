import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/helpers/theme_helper.dart';

enum MyThemeMode { dark, light }

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData.light();

  setThemeData(MyThemeMode mode) {
    themeData = mode == MyThemeMode.light
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}
