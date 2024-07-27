import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get o10 => withOpacity(0.1);

  Color get o20 => withOpacity(0.2);

  Color get o30 => withOpacity(0.3);

  Color get o40 => withOpacity(0.4);

  Color get o50 => withOpacity(0.5);

  Color get o60 => withOpacity(0.6);

  Color get o70 => withOpacity(0.7);

  Color get o80 => withOpacity(0.8);

  Color get o90 => withOpacity(0.9);
}

extension TextStyleColorExtension on TextStyle {
  TextStyle get o10 => copyWith(color: color?.withOpacity(0.1));

  TextStyle get o20 => copyWith(color: color?.withOpacity(0.2));

  TextStyle get o30 => copyWith(color: color?.withOpacity(0.3));

  TextStyle get o40 => copyWith(color: color?.withOpacity(0.4));

  TextStyle get o50 => copyWith(color: color?.withOpacity(0.5));

  TextStyle get o60 => copyWith(color: color?.withOpacity(0.6));

  TextStyle get o70 => copyWith(color: color?.withOpacity(0.7));

  TextStyle get o80 => copyWith(color: color?.withOpacity(0.8));

  TextStyle get o90 => copyWith(color: color?.withOpacity(0.9));
}
