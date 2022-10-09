import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';

ThemeData lightTheme = _getTheme(
  primaryColorLight: lightThemeLightShade,
  primaryColorDark: lightThemeDarkShade,
  backgroundColor: Colors.white,
  textColor: Colors.black,
  brightness: Brightness.light,
);

ThemeData darkTheme = _getTheme(
  primaryColorLight: darkThemeLightShade,
  primaryColorDark: darkThemeDarkShade,
  backgroundColor: Colors.black,
  textColor: Colors.white,
  dividerColor: darkThemeLightShade,
  brightness: Brightness.dark,
);

ThemeData _getTheme({
  required Color primaryColorLight,
  required Color primaryColorDark,
  required Color backgroundColor,
  required Color textColor,
  Color? dividerColor,
  Brightness? brightness,
}) {
  return ThemeData(
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: textColor,
      ),
      backgroundColor: backgroundColor,
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: backgroundColor,
    dividerColor: dividerColor,
    brightness: brightness,
    textTheme: const TextTheme().copyWith(
      bodyText2: TextStyle(fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}
