import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get primaryWhite => copyWith(color: AppColors.primaryWhite);

  TextStyle get secondaryWhite => copyWith(color: AppColors.secondaryWhite);

  TextStyle get tertiaryWhite => copyWith(color: AppColors.tertiaryWhite);

  TextStyle get primaryBlack => copyWith(color: AppColors.primaryBlack);

  TextStyle get primaryPink => copyWith(color: AppColors.primaryPink);

  TextStyle get primaryBlue => copyWith(color: AppColors.primaryBlue);

  TextStyle get secondaryBlue => copyWith(color: AppColors.secondaryBlue);


  TextStyle get gray100 => copyWith(color: AppColors.gray100);

  TextStyle get gray80 => copyWith(color: AppColors.gray80);

  TextStyle get gray60 => copyWith(color: AppColors.gray60);

  TextStyle get gray40 => copyWith(color: AppColors.gray40);

  TextStyle get gray20 => copyWith(color: AppColors.gray20);

  TextStyle get gray10 => copyWith(color: AppColors.gray10);

  TextStyle get gray0 => copyWith(color: AppColors.gray0);

  TextStyle get white2 => copyWith(color: AppColors.white2);

  TextStyle get white10 => copyWith(color: AppColors.white10);

  TextStyle get white30 => copyWith(color: AppColors.white30);

  TextStyle get white60 => copyWith(color: AppColors.white60);

  TextStyle get black2 => copyWith(color: AppColors.black2);

  TextStyle get black10 => copyWith(color: AppColors.black10);

  TextStyle get black30 => copyWith(color: AppColors.black30);

  TextStyle get black60 => copyWith(color: AppColors.black60);

  TextStyle blackWhite(BuildContext context) => copyWith(
        color: context.blackWhite,
      );

  TextStyle blackWhite2(BuildContext context) => copyWith(
        color: context.blackWhite2,
      );

  TextStyle blackWhite10(BuildContext context) => copyWith(
        color: context.blackWhite10,
      );

  TextStyle blackWhite30(BuildContext context) => copyWith(
        color: context.blackWhite30,
      );

  TextStyle blackWhite60(BuildContext context) => copyWith(
        color: context.blackWhite60,
      );
}
