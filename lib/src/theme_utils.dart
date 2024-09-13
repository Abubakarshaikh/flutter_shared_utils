import 'package:flutter/material.dart';
import 'package:flutter_shared_utils/src/padding_utils.dart';
import 'package:flutter_shared_utils/src/radius_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
  final ColorScheme _colorScheme;
  ThemeUtils(
    this._colorScheme,
  );
  BottomNavigationBarThemeData get kbaseBottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  IconThemeData get kBaseIconThemeData => IconThemeData(
        color: _colorScheme.onSurface,
      );

  TabBarTheme get kBaseTabBarTheme => TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: _colorScheme.onPrimary,
        indicatorColor: _colorScheme.surface,
      );

  ProgressIndicatorThemeData get kBaseProgressIndicatorThemeData =>
      ProgressIndicatorThemeData(
        color: _colorScheme.onPrimary,
        circularTrackColor: _colorScheme.primary,
      );

  ListTileThemeData get kBaseListTileThemeData => const ListTileThemeData();

  DrawerThemeData get kBaseDrawerThemeData => DrawerThemeData(
        backgroundColor: _colorScheme.surface,
      );

  AppBarTheme get kBaseAppBarTheme => AppBarTheme(
        backgroundColor: _colorScheme.primary,
        iconTheme: kBaseIconThemeData.copyWith(
          color: _colorScheme.onPrimary,
        ),
        foregroundColor: _colorScheme.onPrimary,
      );

  ElevatedButtonThemeData get kBaseElevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(RadiusUtils.k2Radius),
          ),
          backgroundColor: _colorScheme.primary,
          padding: PaddingUtils.k12Vertical,
        ),
      );

  TextButtonThemeData get kBaseTextButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _colorScheme.primary,
        ),
      );

  InputDecorationTheme get kBaseInputDecorationTheme => InputDecorationTheme(
        contentPadding: PaddingUtils.k4Horizontal,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(RadiusUtils.k2Radius),
          borderSide: BorderSide(
            width: 0.6,
            color: _colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(RadiusUtils.k2Radius),
          borderSide: BorderSide(
            width: 0.6,
            color: _colorScheme.outline,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(RadiusUtils.k2Radius),
          borderSide: BorderSide(
            width: 0.6,
            color: _colorScheme.outline,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(RadiusUtils.k2Radius),
          borderSide: BorderSide(
            width: 0.6,
            color: _colorScheme.outline,
          ),
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        floatingLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      );

  DividerThemeData get kBaseDividerThemeData => DividerThemeData(
        color: _colorScheme.outline,
      );

  TextTheme get kBaseTextTheme => GoogleFonts.openSansTextTheme();

  CheckboxThemeData get kBaseCheckboxTheme {
    return CheckboxThemeData(
      checkColor: WidgetStatePropertyAll<Color>(
        _colorScheme.onPrimary,
      ),
    );
  }

  IconButtonThemeData get kBaseIconButtonTheme {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        // backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.onSurface,
      ),
    );
  }
}
