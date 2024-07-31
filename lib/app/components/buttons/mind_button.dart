import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_easy/core/theme/app_colors.dart';

enum ButtonType {
  text,
  icon,
}

enum ButtonSize {
  small,
  large,
}

class MindButton extends StatelessWidget {
  const MindButton({
    required this.onPressed,
    required this.title,
    super.key,
    this.size = ButtonSize.large,
    this.type = ButtonType.text,
    this.icon,
    this.svgPath = '',
  });

  const MindButton.largeText({
    required this.onPressed,
    required this.title,
    super.key,
  })  : icon = null,
        svgPath = '',
        size = ButtonSize.large,
        type = ButtonType.text;

  const MindButton.smallText({
    required this.onPressed,
    required this.title,
    super.key,
  })  : icon = null,
        svgPath = '',
        size = ButtonSize.small,
        type = ButtonType.text;

  const MindButton.iconSmall({
    required this.onPressed,
    this.icon,
    this.svgPath = '',
    super.key,
  })  : title = '',
        size = ButtonSize.small,
        type = ButtonType.icon;

  const MindButton.iconLarge({
    required this.onPressed,
    this.icon,
    this.svgPath = '',
    super.key,
  })  : title = '',
        size = ButtonSize.large,
        type = ButtonType.icon;

  final ButtonSize size;
  final VoidCallback onPressed;
  final String title;
  final ButtonType type;
  final IconData? icon;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.text:
        return LayoutBuilder(
          builder: (context, constraints) => FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              fixedSize: Size(
                size == ButtonSize.large
                    ? constraints.maxWidth
                    : constraints.maxWidth - 48,
                54,
              ),
            ),
            child: Text(title),
          ),
        );

      case ButtonType.icon:
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            fixedSize: Size(
              size == ButtonSize.large ? 56 : 36,
              size == ButtonSize.large ? 56 : 36,
            ),
          ),
          child: icon != null
              ? Icon(
                  icon,
                  color: AppColors.primaryWhite,
                  size: size == ButtonSize.large ? 32 : 24,
                )
              : SvgPicture.asset(
                  svgPath,
                  width: size == ButtonSize.large ? 32 : 24,
                  height: size == ButtonSize.large ? 32 : 24,
                ),
        );
    }
  }
}
