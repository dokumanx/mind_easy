import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/extensions/theme_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_size.dart';
import 'package:mind_easy/gen/assets.gen.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.textInputAction,
    this.decoration,
    this.style,
    this.contentPadding,
    this.hintText,
    this.prefixIconSize = 24,
    this.prefixIconPath = '',
    this.suffixIconSize = 24,
    this.suffixIconPath = '',
    this.prefixSpacing = 0,
    this.suffixSpacing = 0,
    this.showObscure = false,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final String prefixIconPath;
  final String suffixIconPath;
  final double prefixIconSize;
  final double suffixIconSize;
  final double prefixSpacing;
  final double suffixSpacing;
  final bool showObscure;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late final TextEditingController _textController;
  final _isObscure = ValueNotifier(true);

  bool _isEmpty = true;

  @override
  void initState() {
    _textController = widget.controller ?? TextEditingController();
    _textController.addListener(_onInteract);

    super.initState();
  }

  @override
  void dispose() {
    _textController
      ..removeListener(_onInteract)
      ..dispose();
    super.dispose();
  }

  void _onInteract() {
    _isEmpty = _textController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscure,
      builder: (context, value, child) {
        return ValueListenableBuilder(
          valueListenable: _textController,
          builder: (context, value, child) {
            final darkPrefixColor =
                _isEmpty ? AppColors.white30 : AppColors.primaryWhite;
            final lightPrefixColor =
                _isEmpty ? AppColors.black30 : AppColors.primaryBlack;

            final suffixIcon = widget.showObscure
                ? IconButton(
                    icon: _isObscure.value
                        ? MindAssets.icons.eyeOff.svg(
                            colorFilter: ColorFilter.mode(
                              context.isDarkMode
                                  ? darkPrefixColor
                                  : lightPrefixColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : MindAssets.icons.eye.svg(
                            colorFilter: ColorFilter.mode(
                              context.isDarkMode
                                  ? darkPrefixColor
                                  : lightPrefixColor,
                              BlendMode.srcIn,
                            ),
                          ),
                    onPressed: () {
                      _isObscure.value = !_isObscure.value;
                    },
                  )
                : widget.suffixIconPath.isEmpty
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.sm,
                            ) +
                            EdgeInsets.only(
                              left: widget.suffixSpacing,
                            ),
                        child: SvgPicture.asset(
                          widget.suffixIconPath,
                          height: widget.suffixIconSize,
                          width: widget.suffixIconSize,
                          colorFilter: ColorFilter.mode(
                            context.isDarkMode
                                ? darkPrefixColor
                                : lightPrefixColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      );

            return TextField(
              controller: _textController,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
              obscureText: _isObscure.value,
              textInputAction: widget.textInputAction,
              decoration:
                  (widget.decoration ?? const InputDecoration()).copyWith(
                hintText: widget.hintText,
                prefixIcon: widget.prefixIconPath.isEmpty
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.sm,
                            ) +
                            EdgeInsets.only(
                              left: widget.prefixSpacing,
                            ),
                        child: SvgPicture.asset(
                          widget.prefixIconPath,
                          height: widget.prefixIconSize,
                          width: widget.prefixIconSize,
                          colorFilter: ColorFilter.mode(
                            context.isDarkMode
                                ? darkPrefixColor
                                : lightPrefixColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                prefixIconConstraints: const BoxConstraints(),
                suffixIcon: suffixIcon,
                suffixIconConstraints: const BoxConstraints(),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: AppSize.lg,
                    ),
              ),
              textAlignVertical: TextAlignVertical.center,
              cursorColor: context.blackWhite30,
              style: widget.style ??
                  AppTextStyles.body14Light.copyWith(
                    color: context.isDarkMode
                        ? AppColors.primaryWhite
                        : AppColors.primaryBlack,
                  ),
            );
          },
        );
      },
    );
  }
}
