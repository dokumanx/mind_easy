import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/extensions/spacing_extension.dart';
import 'package:mind_easy/core/extensions/text_style_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_size.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.lg,
        vertical: AppSize.md,
      ),
      decoration: BoxDecoration(
        color: context.blackWhite2,
        borderRadius: BorderRadius.circular(AppSize.md),
        border: Border.all(
          color: context.blackWhite10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Focus Timer',
              style: AppTextStyles.body16Medium.blackWhite(context),
            ),
          ),
          28.h,
          Text(
            'Create your Focus Schedule',
            style: AppTextStyles.body12Light.blackWhite60(context),
          ),
          28.h,
          Row(
            children: [
              'May',
              'Jun',
              'Jul',
              'Aug',
              'Sep',
            ]
                .map(
                  (e) => Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e,
                        style: AppTextStyles.body10Light.blackWhite(context),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          AppSize.xs.h,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 140,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: AppSize.xs,
              mainAxisSpacing: AppSize.xs,
              crossAxisCount: 20,
            ),
            itemBuilder: (context, index) {
              final isSelected = index % 8 == 0;
              return DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryPink : context.blackWhite10,
                  borderRadius: BorderRadius.circular(AppSize.xxs),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
