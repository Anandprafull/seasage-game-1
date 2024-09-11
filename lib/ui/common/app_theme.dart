import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/app_colors.dart';

const buttonTextStyle = TextStyle(
  fontFamily: 'PixeloidSans',
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

final smallButtonTextStyle = buttonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

final appTheme = ThemeData(
  // Colors
  fontFamily: 'PixeloidSans',
  scaffoldBackgroundColor: Colors.transparent,

  textTheme: TextTheme(
    titleLarge: TextStyle(fontFamily: 'PixeloidSans', fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(2, 2), blurRadius: 3),
    ]),
    titleMedium: TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(2, 2), blurRadius: 3),
    ]),
    bodyLarge: TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(2, 2), blurRadius: 3),
    ]),
    bodyMedium: TextStyle(fontFamily: 'PixeloidSans', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(1, 1), blurRadius: 2),
    ]),
    bodySmall: TextStyle(fontFamily: 'PixeloidSans', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(1, 1), blurRadius: 1),
    ]),
  ),

  // AppBar
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
      Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(2, 2), blurRadius: 3),
    ]),
    backgroundColor: Colors.white.withOpacity(0.4),
    elevation: 3,
    foregroundColor: Colors.white,
  ),

  // Navigation Bar
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white.withOpacity(0.3),
    elevation: 3,
    indicatorColor: Colors.white.withOpacity(0.7),
    labelTextStyle: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected)
        ? TextStyle(fontFamily: 'PixeloidSans', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, shadows: [
            Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(2, 2), blurRadius: 3),
          ])
        : TextStyle(fontFamily: 'PixeloidSans', fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white, shadows: [
            Shadow(color: Colors.black.withOpacity(0.7), offset: const Offset(1, 1), blurRadius: 2),
          ])),
  ),

  // Divider + Line on persistentbuttons
  dividerColor: Colors.transparent,
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),

  // Input
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white.withOpacity(0.3),
    filled: true,
    hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: kcPrimaryColor.withOpacity(0.7),
    labelStyle: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.all(10),
    labelPadding: const EdgeInsets.all(5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.white),
    ),
  ),

  switchTheme: SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.white.withOpacity(0.3)),
    trackOutlineColor:
        WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : Colors.white.withOpacity(0.3)),
  ),

  // SnackBar
  snackBarTheme: SnackBarThemeData(
    insetPadding: const EdgeInsets.all(10),
    backgroundColor: Colors.white.withOpacity(0.7),
    contentTextStyle: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
    actionTextColor: Colors.white,
  ),
);
