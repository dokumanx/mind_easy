import 'package:flutter/material.dart';
import 'package:mind_easy/app/components/text_fields/default_text_field.dart';
import 'package:mind_easy/core/utils/app_size.dart';
import 'package:mind_easy/gen/assets.gen.dart';

class MindTextField extends DefaultTextField {
  const MindTextField({
    super.key,
    super.controller,
    super.onChanged,
    super.onSubmitted,
    super.onTap,
    super.textInputAction,
    super.decoration,
    super.style,
    super.hintText,
    super.prefixIconPath,
    super.suffixIconPath,
    EdgeInsets? contentPadding,
  }) : super(
          prefixIconSize: 24,
          prefixSpacing: AppSize.sm,
          suffixIconSize: 24,
          suffixSpacing: AppSize.sm,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppSize.lg,
                horizontal: AppSize.sm,
              ),
        );

  MindTextField.email({
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
          prefixIconPath: MindAssets.icons.message.path,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppSize.lg,
                horizontal: AppSize.sm,
              ),
        );

  MindTextField.password({
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
          prefixIconPath: MindAssets.icons.lock.path,
          showObscure: true,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppSize.lg,
                horizontal: AppSize.sm,
              ),
        );
}
