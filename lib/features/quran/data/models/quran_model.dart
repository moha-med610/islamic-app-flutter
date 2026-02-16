import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_model.g.dart';

@JsonSerializable()
class QuranModel extends QuranEntity {
  QuranModel({
    required super.surahName,
    @JsonKey(name: "surahNameArabicLong") required super.surahNameAr,
    required super.revelationPlace,
    required super.totalAyah,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) =>
      _$QuranModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranModelToJson(this);

  QuranEntity toEntity() => QuranEntity(
    surahName: surahName,
    surahNameAr: surahNameAr,
    revelationPlace: revelationPlace,
    totalAyah: totalAyah,
  );
}
