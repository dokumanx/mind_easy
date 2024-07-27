import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/extensions/spacing_extension.dart';
import 'package:mind_easy/core/extensions/text_style_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_spacing.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Focus Timer',
              style: AppTextStyles.body16Medium.primaryWhite,
            ),
          ),
          28.h,
          Text(
            'Create your Focus Schedule',
            style: AppTextStyles.body12Light.primaryWhite.o60,
          ),
          28.h,
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryPink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.timer,
                  color: AppColors.primaryWhite,
                ),
              ),
              16.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25 min',
                    style: AppTextStyles.body12Light.primaryWhite,
                  ),
                  4.h,
                  Text(
                    'Focus Time',
                    style: AppTextStyles.body16Light.primaryWhite.o60,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
