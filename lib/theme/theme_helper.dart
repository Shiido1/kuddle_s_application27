import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {

  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map



    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      useMaterial3: false,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary.withOpacity(1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.green80001,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray400,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray400,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 40.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 31.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 26.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 9.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 22.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF003B95),
    primaryContainer: Color(0XFFFFB700),

    // Error colors
    errorContainer: Color(0XFF4D4D4D),

    // On colors(text colors)
    onPrimary: Color(0X51FFFFFF),
    onPrimaryContainer: Color(0X0C003B95),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue700 => Color(0XFF006CE4);

  // BlueGray
  Color get blueGray10000 => Color(0X00D9D9D9);
  Color get blueGray400 => Color(0XFF888888);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFFFDDDD);
  Color get deepOrangeA700 => Color(0XFFF91A1A);

  // DeepPurple
  Color get deepPurpleA200 => Color(0XFF9747FF);

  // Gray
  Color get gray100 => Color(0XFFEFFFF5);
  Color get gray400 => Color(0XFFC4C4C4);
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray500 => Color(0XFF999999);
  Color get gray700 => Color(0XFF616161);

  // Graye
  Color get gray505e => Color(0X5EFAFAFA);

  // Grayf
  Color get gray7003f => Color(0X3F5C5C5C);

  // Green
  Color get green800 => Color(0XFF25A211);
  Color get green80001 => Color(0XFF008234);

  // Pinkc
  Color get pink3004c => Color(0X4CEB6B9F);

  // Red
  Color get red500 => Color(0XFFFF3B30);
  Color get redA400 => Color(0XFFFF1B1B);
  Color get redA40001 => Color(0XFFFF1A1A);

  // Yellow
  Color get yellow800 => Color(0XFFF79E1B);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
