// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerResponse _$PrayerResponseFromJson(Map<String, dynamic> json) =>
    PrayerResponse(
      code: (json['code'] as num).toInt(),
      status: json['status'] as String,
      timings: PrayerTimeModel.fromJson(
        json["data"]?['timings'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PrayerResponseToJson(PrayerResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'timings': instance.timings,
    };
