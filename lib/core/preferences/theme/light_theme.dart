
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class LightTheme{

  LightTheme(this.primaryColor);

  final Color primaryColor;
  final Color errorColor = MainColors.red;
  final Color scaffoldColor = MainColors.white;
  final Color textSolidColor = MainColors.black;
  final Color textDisabledColor = MainColors.black[400]!;
  final Color borderColor = MainColors.white[500]!;
  final Color? disabledColor = MainColors.white[200];
  final Color inputColor = MainColors.white[400]!;
  final String fontFamily = 'Poppins';


  ColorScheme get colorScheme => ColorScheme.light(
    primary: primaryColor,
    secondary: scaffoldColor,
    onError: errorColor,
  );

  AppBarTheme get appBarTheme => AppBarTheme(
    centerTitle: false,
     surfaceTintColor: scaffoldColor,
     );

  CardThemeData get cardTheme => CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacing.sp8),
        side: BorderSide(color: borderColor)
    ),
  );

  TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp32,
      fontWeight: FontWeight.bold,
      color: textSolidColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp24,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp20,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.defaultSize,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp14,
      fontWeight: FontWeight.w600,
      color: textSolidColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.defaultSize,
      fontWeight: FontWeight.w500,
      color: textSolidColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp14,
      fontWeight: FontWeight.w400,
      color: disabledColor,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: Spacing.sp12,
      fontWeight: FontWeight.w500,
      color: textDisabledColor,
    ),
  );

  BottomNavigationBarThemeData get bottomNavigationBarTheme =>BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    selectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Spacing.sp10,
        color: primaryColor
    ),
    unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Spacing.sp10,
        color: disabledColor
    ),
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: textTheme.titleMedium,
      backgroundColor: primaryColor,
      foregroundColor: MainColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacing.sp8),
      ),
    ),
  );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: textTheme.titleMedium,
      foregroundColor: primaryColor,
      side: BorderSide(color: primaryColor,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacing.sp8),
      ),
    ),
  );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    fillColor: inputColor,
    filled: true,
    prefixIconColor: textDisabledColor,
    hintStyle: textTheme.labelMedium,
    contentPadding: EdgeInsets.symmetric(
        horizontal: Spacing.defaultSize,
        vertical: Spacing.sp12
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacing.sp8),
      borderSide: BorderSide.none,
    ),
    disabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacing.sp8),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacing.sp8),
      borderSide: BorderSide(color: primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacing.sp8),
      borderSide: BorderSide(color: errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacing.sp8),
      borderSide: BorderSide(color: errorColor),
    ),
  );

  ThemeData get theme {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      appBarTheme: appBarTheme,
      cardTheme: cardTheme,
      textTheme: textTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}