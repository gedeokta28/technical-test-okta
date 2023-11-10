import 'package:flutter/material.dart';

import '../static/colors.dart';
import '../static/dimens.dart';

final themeData = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    onPrimary: whiteColor,
    onSurface: Color.fromARGB(255, 29, 38, 41),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: whiteColor,
      backgroundColor: primaryColor,
      padding: const EdgeInsets.symmetric(vertical: sizeMedium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20)),
);
