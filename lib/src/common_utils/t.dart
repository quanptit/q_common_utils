import 'package:flutter/material.dart';

class T {
  // static ThemeMode getThemeMode(BuildContext context) {
  //   return Provider.of<AppThemeModel>(context)._themeMode;
  // }
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  static bool isDark(BuildContext context) {
    return (Theme.of(context).brightness == Brightness.dark);
  }

  static ColorScheme getColors(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static Color onSurfaceColorWithAlpha(BuildContext context, {int a = 150}) {
    return Theme.of(context).colorScheme.onSurface.withAlpha(a);
  }

  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static TextStyle? textTitleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle? textTitleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? textTitleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? textLabelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }

  static TextStyle? textLabelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }

  static TextStyle? textLabelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }

  static TextStyle? textBodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? textBodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? textBodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? textLabelMediumOnPrimaryContainerColor(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return themeData.textTheme.labelMedium?.copyWith(color: themeData.colorScheme.onPrimaryContainer);
  }

  static TextStyle? textLabelSmallPrimaryColor(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return themeData.textTheme.labelSmall?.copyWith(color: themeData.colorScheme.primary);
  }

  T._();
}
