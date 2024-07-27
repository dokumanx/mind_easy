import 'package:flutter/material.dart';
import 'package:mind_easy/core/theme/app_colors.dart';


extension TextStyleExtension on TextStyle {
  TextStyle get primaryWhite => copyWith(color: AppColors.primaryWhite);
  TextStyle get primaryBlack => copyWith(color: AppColors.primaryBlack);
  TextStyle get primaryPink => copyWith(color: AppColors.primaryPink);
  TextStyle get primaryBlue => copyWith(color: AppColors.primaryBlue);
  TextStyle get secondaryBlue => copyWith(color: AppColors.secondaryBlue);
  TextStyle get background => copyWith(color: AppColors.background);

  TextStyle get gray100 => copyWith(color: AppColors.gray100);
  TextStyle get gray80 => copyWith(color: AppColors.gray80);
  TextStyle get gray60 => copyWith(color: AppColors.gray60);
  TextStyle get gray40 => copyWith(color: AppColors.gray40);
  TextStyle get gray20 => copyWith(color: AppColors.gray20);
  TextStyle get gray10 => copyWith(color: AppColors.gray10);
  TextStyle get gray0 => copyWith(color: AppColors.gray0);
}

