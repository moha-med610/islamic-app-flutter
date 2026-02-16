// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranModel _$QuranModelFromJson(Map<String, dynamic> json) => QuranModel(
  surahName: json['surahName'] as String,
  surahNameAr: json['surahNameArabicLong'] as String,
  revelationPlace: json['revelationPlace'] as String,
  totalAyah: (json['totalAyah'] as num).toInt(),
);

Map<String, dynamic> _$QuranModelToJson(QuranModel instance) =>
    <String, dynamic>{
      'surahName': instance.surahName,
      'surahNameArabicLong': instance.surahNameAr,
      'revelationPlace': instance.revelationPlace,
      'totalAyah': instance.totalAyah,
    };
