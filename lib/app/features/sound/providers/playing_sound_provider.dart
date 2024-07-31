import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playing_sound_provider.g.dart';

@riverpod
class PlayingSound extends _$PlayingSound {
  @override
  SoundModel? build() {
    return null;
  }

  SoundModel? get value => state;

  set value(SoundModel? value) => state = value;

  void toggle(SoundModel sound) {
    if (state == sound) {
      state = null;
    } else {
      state = sound;
    }
  }
}
