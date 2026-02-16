import 'package:dio/dio.dart';
import 'package:islamic_app/core/network/api_constants.dart';
import 'package:islamic_app/features/quran/data/models/quran_model.dart';
import 'package:islamic_app/features/quran/data/models/surah_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'quran_service.g.dart';

@RestApi(baseUrl: ApiConstants.quranUrl)
abstract class QuranService {
  factory QuranService(Dio dio, {String? baseUrl}) = _QuranService;

  @GET("/surah.json")
  Future<List<QuranModel>> getQuran();

  @GET("{num}.json")
  Future<SurahModel> getSurah(@Path() int num);
}
