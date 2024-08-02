import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/theme_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';

class MindDivider extends StatelessWidget {
  const MindDivider({
    super.key,
    this.height = 32,
    this.thickness = 1,
    this.indent,
    this.endIndent,
    this.color,
  });

  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final themedColor = context.isDarkMode
        ? const Color(0xFFD9D9D9).withOpacity(0.06)
        : AppColors.tertiaryWhite;

    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color ?? themedColor,
    );
  }
}
