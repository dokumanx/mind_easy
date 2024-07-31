import 'package:mind_easy/core/utils/directional_spacers.dart';

extension SpacingExtension on num {
  // height
  VerticalSpace get h => VerticalSpace(toDouble());

  // width
  HorizontalSpace get w => HorizontalSpace(toDouble());
}
