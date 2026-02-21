import 'package:dio/dio.dart';
import 'package:islamic_app/core/network/api_constants.dart';
import 'package:islamic_app/features/prayers/data/models/prayer_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'prayer_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.prayerUrl)
abstract class PrayerDataSource {
  factory PrayerDataSource(Dio dio, {String? baseUrl}) = _PrayerDataSource;

  @GET('timings/{date}')
  Future<PrayerResponse> getPrayer(
    @Path("date") String date,
    @Query("latitude") double latitude,
    @Query("longitude") double longitude,
  );
}
