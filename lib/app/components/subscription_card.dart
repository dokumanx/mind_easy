import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/extensions/text_style_extension.dart';
import 'package:mind_easy/core/extensions/theme_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_size.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor =
        context.isDarkMode ? AppColors.white10 : AppColors.primaryPink.o20;

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.isDarkMode ? null : AppColors.primaryPink.o10,
        gradient: context.isDarkMode
            ? LinearGradient(
                colors: [
                  AppColors.primaryPink.withOpacity(0),
                  AppColors.primaryPink.withOpacity(.22),
                ],
                stops: const [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.8,
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.md),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.ml) +
            const EdgeInsets.only(left: AppSize.lg, right: AppSize.md),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Focus',
                    style: AppTextStyles.body16Bold.blackWhite(context),
                    children: [
                      TextSpan(
                        text: ' timer',
                        style: AppTextStyles.body16Bold.primaryPink,
                      ),
                    ],
                  ),
                ),
                Text(
                  '7 days free trial',
                  style: AppTextStyles.body12Light.blackWhite60(context),
                ),
              ],
            ),
            const Spacer(),
            ChipTheme(
                data: context.theme.chipTheme.copyWith(
                  labelStyle: AppTextStyles.body16Medium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),

                  backgroundColor: AppColors.primaryPink,
                ),
                child: ActionChip(
                  label: const Text(
                    'Subscribe',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    // TODO: Add subscription logic
                  },
                )),
          ],
        ),
      ),
    );
  }
}
