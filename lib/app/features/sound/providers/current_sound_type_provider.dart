import 'package:mind_easy/core/enums/sound_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_sound_type_provider.g.dart';

@riverpod
class CurrentSoundType extends _$CurrentSoundType {
  @override
  SoundType? build() {
    return null;
  }

  void updateType(SoundType? value) {
    if (value == state) {
      state = null;
    } else {
      state = value;
    }
  }
}
