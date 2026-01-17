import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundBeige,
      elevation: 0,

      centerTitle: true,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundBeige,
    fontFamily: 'Cairo',
  );
}
