import 'package:flutter/material.dart';
import 'package:mind_easy/core/extensions/theme_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';

class MindChip extends StatelessWidget {
  const MindChip({
    required this.onSelected,
    required this.label,
    required this.selected,
    super.key,
  });

  final ValueChanged<bool>? onSelected;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: Text(label),
        onSelected: onSelected,
        selected: selected,
        side: selected
            ? const BorderSide(
                color: AppColors.primaryPink,
                width: 0.8,
              )
            : null,
      ),
    );
  }
}
