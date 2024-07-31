import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';
import 'package:mind_easy/app/features/sound/domain/sound_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'get_sounds_provider.g.dart';

@riverpod
Future<List<SoundModel>> getSounds(GetSoundsRef ref) async {
  return SoundRepository().getSounds();
}
