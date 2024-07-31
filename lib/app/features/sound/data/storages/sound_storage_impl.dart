import 'package:mind_easy/app/features/sound/data/data_sources/sound/sound_source.dart';
import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';
import 'package:mind_easy/app/features/sound/domain/storages/sound_storage.dart';

class SoundStorageImpl implements SoundStorage {
  SoundStorageImpl(this._soundSource);

  final SoundSource _soundSource;

  @override
  Future<List<SoundModel>> getSounds() async {
    return _soundSource.getSounds();
  }
}
