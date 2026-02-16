import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';

class SurahEntity extends QuranEntity {
  final int surahNo;
  final Map<String, AudioEntity> audio;
  final List<String> ayah;
  SurahEntity({
    required super.surahName,
    required super.surahNameAr,
    required super.revelationPlace,
    required super.totalAyah,
    required this.surahNo,
    required this.audio,
    required this.ayah,
  });
}

class AudioEntity {
  final String reciter;
  final String url;
  final String originalUrl;

  const AudioEntity({
    required this.reciter,
    required this.url,
    required this.originalUrl,
  });
}
