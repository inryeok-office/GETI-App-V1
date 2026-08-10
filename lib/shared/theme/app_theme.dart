import 'package:flutter/material.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    ),
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTypography.textTheme,
  );
}
