import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget responsiveHorizontalSpace(BuildContext context) => SizedBox(width: getResponsiveHorizontalSpaceMedium(context));

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => context.width;

double screenHeight(BuildContext context) => context.height;

double screenHeightFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 4);

double halfScreenHeight(BuildContext context) => screenHeightFraction(context, dividedBy: 2);

double thirdScreenHeight(BuildContext context) => screenHeightFraction(context, dividedBy: 3);

double quarterScreenHeight(BuildContext context) => screenHeightFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) => screenWidthFraction(context, dividedBy: 50);

double getResponsiveBodySmallFontSize(BuildContext context, {double? min}) => getResponsiveFontSize(context, fontSize: 14, maxSize: 18, minSize: min);

double getResponsiveBodyMediumFontSize(BuildContext context, {double? min}) =>
    getResponsiveFontSize(context, fontSize: 16, maxSize: 20, minSize: min);

double getResponsiveBodyLargeFontSize(BuildContext context, {double? min}) => getResponsiveFontSize(context, fontSize: 20, maxSize: 25, minSize: min);

double getResponsiveTitleMediumFontSize(BuildContext context, {double? min}) =>
    getResponsiveFontSize(context, fontSize: 20, maxSize: 30, minSize: min);

double getResponsiveTitleLargeFontSize(BuildContext context, {double? min}) =>
    getResponsiveFontSize(context, fontSize: 30, maxSize: 40, minSize: min);

double getResponsiveFontSize(BuildContext context, {double? fontSize, double? maxSize, double? minSize}) {
  maxSize ??= 50;

  var responsiveSize = min(screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100), maxSize);

  if (minSize != null) {
    responsiveSize = max(responsiveSize, minSize);
  }

  return responsiveSize;
}

EdgeInsets getResponsivePadding(BuildContext context) => EdgeInsets.symmetric(
    horizontal: screenWidth(context) <= 1000 ? screenWidthFraction(context, dividedBy: 10) : screenWidthFraction(context, dividedBy: 20),
    vertical: 20);
