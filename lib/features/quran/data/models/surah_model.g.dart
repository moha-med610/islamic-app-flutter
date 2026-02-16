// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
  surahName: json['surahName'] as String,
  surahNameAr: json['surahNameArabicLong'] as String,
  revelationPlace: json['revelationPlace'] as String,
  totalAyah: (json['totalAyah'] as num).toInt(),
  surahNo: (json['surahNo'] as num).toInt(),
  audioMap: json['audio'] == null
      ? {}
      : SurahModel._audioFromJson(json['audio'] as Map<String, dynamic>?),
  ayah: (json['arabic1'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'surahName': instance.surahName,
      'surahNameArabicLong': instance.surahNameAr,
      'revelationPlace': instance.revelationPlace,
      'totalAyah': instance.totalAyah,
      'surahNo': instance.surahNo,
      'arabic1': instance.ayah,
      'audio': SurahModel._audioToJson(instance.audioMap),
    };
