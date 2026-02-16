import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_model.g.dart';

@JsonSerializable()
class AudioModel extends AudioEntity {
  const AudioModel({
    required super.reciter,
    required super.url,
    required super.originalUrl,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}
