import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';

abstract class SoundSource {
  Future<List<SoundModel>> getSounds();
}
