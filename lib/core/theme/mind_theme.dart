import 'package:flutter/material.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_size.dart';

class MindTheme {
  static ThemeData get lightTheme => _lightTheme;

  static ThemeData get _baseTheme => ThemeData(
        useMaterial3: true,
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          //Not selected
          backgroundColor: AppColors.white2,
          // Selected
          selectedColor: AppColors.primaryPink,
          secondaryLabelStyle: AppTextStyles.body14Regular.copyWith(
            color: AppColors.primaryWhite,
          ),
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.sm,
            horizontal: 6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
            side: const BorderSide(
              color: AppColors.primaryPink,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryPink),
            textStyle: WidgetStateProperty.all(
              AppTextStyles.body16Medium,
            ),
            foregroundColor: WidgetStateProperty.all(AppColors.primaryWhite),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: AppSize.lg,
                horizontal: AppSize.md,
              ),
            ),
          ),
        ),
      );

  static ThemeData get _lightTheme => _baseTheme.copyWith(
        brightness: Brightness.light,
        chipTheme: _baseTheme.chipTheme.copyWith(
          brightness: Brightness.light,
          labelStyle: AppTextStyles.body14Regular.copyWith(
            color: AppColors.black60,
          ),
          side: BorderSide(
            color: AppColors.black10,
            width: 0.8,
          ),
        ),
      );

  static ThemeData get darkTheme => _darkTheme;

  static ThemeData get _darkTheme => _baseTheme.copyWith(
        brightness: Brightness.dark,
        chipTheme: _baseTheme.chipTheme.copyWith(
          brightness: Brightness.dark,
          labelStyle: AppTextStyles.body14Regular.copyWith(
            color: AppColors.primaryWhite.withOpacity(.2),
          ),
          side: BorderSide(
            color: AppColors.white10,
            width: 0.8,
          ),
        ),
      );
}
