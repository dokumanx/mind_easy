import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';
import 'package:mind_easy/app/features/sound/domain/sound_repository.dart';
import 'package:mind_easy/app/features/sound/providers/current_sound_type_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_sounds_provider.g.dart';

@riverpod
Future<List<SoundModel>> getSounds(GetSoundsRef ref) async {
  final type = ref.watch(currentSoundTypeProvider);
  final sounds = await SoundRepository().getSounds();

  if(type == null) {
    return sounds;
  }

  return sounds.where((sound) => sound.type == type).toList();
}
