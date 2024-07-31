import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mind_easy/app/features/sound/data/data_sources/sound/sound_source.dart';
import 'package:mind_easy/app/features/sound/data/models/sound_model.dart';

class LocalSoundSource implements SoundSource {
  @override
  Future<List<SoundModel>> getSounds() async {
    try {
      // Load the JSON file from the assets folder
      final jsonString =
          await rootBundle.loadString('assets/dummy_models/sound_models.json');

      // Decode the JSON string
      final jsonMap = jsonDecode(jsonString);

      // Get the list of sound models
      final soundModelsJson = jsonMap['soundModels'] as List<dynamic>;

      // Map the JSON to a list of SoundModel objects
      return soundModelsJson
          .map((json) => SoundModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load sounds');
    }
  }
}
