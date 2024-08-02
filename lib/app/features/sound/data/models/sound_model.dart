import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_easy/core/enums/sound_type.dart';

part 'sound_model.g.dart';

@JsonSerializable()
class SoundModel with EquatableMixin {
  SoundModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.type,
  });

  factory SoundModel.fromJson(Map<String, dynamic> json) =>
      _$SoundModelFromJson(json);

  final String id;
  final String imagePath;
  final String title;
  final String subtitle;
  final int duration;
  final SoundType type;

  Map<String, dynamic> toJson() => _$SoundModelToJson(this);

  @override
  List<Object?> get props => [id, imagePath];
}
