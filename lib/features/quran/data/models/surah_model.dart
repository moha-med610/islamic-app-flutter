import 'package:islamic_app/features/quran/data/models/audio_model.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel extends SurahEntity {
  @JsonKey(
    name: "audio",
    fromJson: _audioFromJson,
    toJson: _audioToJson,
    defaultValue: {},
  )
  final Map<String, AudioEntity> audioMap;

  SurahModel({
    required super.surahName,

    @JsonKey(name: "surahNameArabicLong") required super.surahNameAr,

    required super.revelationPlace,
    required super.totalAyah,
    required super.surahNo,

    required this.audioMap,

    @JsonKey(name: "arabic1") required super.ayah,
  }) : super(audio: audioMap);

  /// fromJson
  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SurahModelToJson(this);

  /// Safe audio parser (handles null)
  static Map<String, AudioEntity> _audioFromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) {
      return {};
    }

    return json.map(
      (key, value) =>
          MapEntry(key, AudioModel.fromJson(value as Map<String, dynamic>)),
    );
  }

  /// Safe audio serializer
  static Map<String, dynamic> _audioToJson(Map<String, AudioEntity>? audio) {
    if (audio == null || audio.isEmpty) {
      return {};
    }

    return audio.map(
      (key, value) => MapEntry(key, (value as AudioModel).toJson()),
    );
  }

  /// Convert to entity
  SurahEntity toEntity() => this;
}
