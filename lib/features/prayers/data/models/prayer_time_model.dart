import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_time_model.g.dart';

@JsonSerializable()
class PrayerTimeModel extends PrayerTimeEntity {
  PrayerTimeModel({
    @JsonKey(name: 'Fajr') String? fajr,
    @JsonKey(name: 'Sunrise') String? sunrise,
    @JsonKey(name: 'Dhuhr') String? dhuhr,
    @JsonKey(name: 'Asr') String? asr,
    @JsonKey(name: 'Sunset') String? sunset,
    @JsonKey(name: 'Maghrib') String? maghrib,
    @JsonKey(name: 'Isha') String? isha,
    @JsonKey(name: 'Imsak') String? imsak,
    @JsonKey(name: 'Midnight') String? midnight,
    @JsonKey(name: 'Firstthird') String? firstThird,
    @JsonKey(name: 'Lastthird') String? lastThird,
  }) : super(
         fajr: fajr ?? "--:--",
         sunrise: sunrise ?? "--:--",
         dhuhr: dhuhr ?? "--:--",
         asr: asr ?? "--:--",
         sunset: sunset ?? "--:--",
         maghrib: maghrib ?? "--:--",
         isha: isha ?? "--:--",
         imsak: imsak ?? "--:--",
         midnight: midnight ?? "--:--",
         firstThird: firstThird ?? "--:--",
         lastThird: lastThird ?? "--:--",
       );

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimeModelFromJson(json);
}
