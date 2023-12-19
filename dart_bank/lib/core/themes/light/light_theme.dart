import 'package:dart_bank/core/themes/light/light_colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final theme = ThemeData(
    iconTheme: const IconThemeData(color: LightColors.deepGreen),
    appBarTheme: const AppBarTheme(
        backgroundColor: LightColors.deepGreen,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Color.fromARGB(255, 9, 4, 4)),
      bodyMedium: TextStyle(color: Color.fromARGB(255, 54, 38, 38)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColors.lightGreen,
        foregroundColor: LightColors.green,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  );
}
