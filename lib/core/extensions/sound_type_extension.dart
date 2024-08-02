import 'package:mind_easy/core/enums/sound_type.dart';

extension SoundTypeExtension on SoundType {
  String get formattedName {
    // Convert enum value to string, replace underscores with spaces, and capitalize each word
    return toString()
        .split('.')
        .last
        .replaceAllMapped(
        RegExp('([a-z])([A-Z])'), (Match m) => '${m.group(1)} ${m.group(2)}')
        .replaceAllMapped(
        RegExp(r'(^| )(\w)'), (Match m) => m.group(0)!.toUpperCase());
  }
}