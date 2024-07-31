import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';

abstract class SoundStorage{
  Future<List<SoundModel>> getSounds();
}