import 'package:flutter/material.dart';
import 'package:mind_easy/app/components/text_fields/default_text_field.dart';
import 'package:mind_easy/core/utils/app_size.dart';
import 'package:mind_easy/gen/assets.gen.dart';

class SearchField extends DefaultTextField {
  SearchField({
    super.key,
    super.controller,
    super.onChanged,
    super.onSubmitted,
    super.onTap,
    super.textInputAction,
    super.decoration,
    super.style,
    super.hintText,
    EdgeInsets? contentPadding,
  }) : super(
          prefixIconPath: MindAssets.icons.search.path,
          prefixIconSize: 18,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppSize.md,
              ),
        );
}
