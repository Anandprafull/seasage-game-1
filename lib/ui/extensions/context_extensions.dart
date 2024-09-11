import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/app_theme.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';

extension BuildContextEntension<T> on BuildContext {
  // Responsive
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet => MediaQuery.of(this).size.width < 1024.0 && MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet => MediaQuery.of(this).size.width < 650.0 && MediaQuery.of(this).size.width > 500.0;

  bool get isLandScape => MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall => MediaQuery.of(this).size.width < 850.0 && MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  // Themes
// text styles

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge?.copyWith(fontSize: getResponsiveTitleLargeFontSize(this, min: 30));

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium?.copyWith(fontSize: getResponsiveTitleMediumFontSize(this, min: 20));

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge?.copyWith(fontSize: getResponsiveBodyLargeFontSize(this, min: 20));

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium?.copyWith(fontSize: getResponsiveBodyMediumFontSize(this, min: 14));

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall?.copyWith(fontSize: getResponsiveBodySmallFontSize(this, min: 12));
  TextStyle? get responsiveButtonTextStyle => buttonTextStyle.copyWith(fontSize: getResponsiveBodySmallFontSize(this, min: 16));
  TextStyle? get responsiveSmallButtonTextStyle => smallButtonTextStyle.copyWith(fontSize: getResponsiveBodySmallFontSize(this, min: 14));

  // colors
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.surface;
}
