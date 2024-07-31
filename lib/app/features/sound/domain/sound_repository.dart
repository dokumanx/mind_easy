import 'package:mind_easy/app/features/sound/data/data_sources/sound/local_sound_source.dart';
import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';
import 'package:mind_easy/app/features/sound/data/storages/sound_storage_impl.dart';
import 'package:mind_easy/app/features/sound/domain/storages/sound_storage.dart';

class SoundRepository {
  SoundRepository() : _soundStorage = SoundStorageImpl(LocalSoundSource());

  final SoundStorage _soundStorage;

  Future<List<SoundModel>> getSounds() async {
    return _soundStorage.getSounds();
  }
}
