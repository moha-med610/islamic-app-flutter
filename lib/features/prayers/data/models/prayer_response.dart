import 'package:islamic_app/features/prayers/data/models/prayer_time_model.dart';
import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_response.g.dart';

@JsonSerializable()
class PrayerResponse {
  final int code;
  final String status;
  final PrayerTimeModel timings;

  PrayerResponse({
    required this.code,
    required this.status,
    required this.timings,
  });

  factory PrayerResponse.fromJson(Map<String, dynamic> json) =>
      _$PrayerResponseFromJson(json);

  PrayerTimeEntity toEntity() => PrayerTimeEntity(
    fajr: timings.fajr,
    sunrise: timings.sunrise,
    dhuhr: timings.dhuhr,
    asr: timings.asr,
    sunset: timings.sunset,
    maghrib: timings.maghrib,
    isha: timings.isha,
    imsak: timings.imsak,
    midnight: timings.midnight,
    firstThird: timings.firstThird,
    lastThird: timings.lastThird,
  );
}
