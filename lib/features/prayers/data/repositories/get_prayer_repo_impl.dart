import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/prayers/data/datasource/location_data_source.dart';
import 'package:islamic_app/features/prayers/data/datasource/prayer_data_source.dart';
import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';
import 'package:islamic_app/features/prayers/domain/repositories/base_get_prayer_repo.dart';

class GetPrayerRepoImpl implements BaseGetPrayerRepo {
  final PrayerDataSource dataSource;
  final LocationDataSource location;

  GetPrayerRepoImpl(this.dataSource, this.location);
  @override
  Future<Either<Failure, PrayerTimeEntity>> getPrayer() async {
    final DateTime now = DateTime.now();
    final DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    final String formattedDate = dateFormat.format(now);

    try {
      // get location
      final position = await location.getLocation();

      // get response
      final result = await dataSource.getPrayer(
        formattedDate,
        position.latitude,
        position.longitude,
      );
      log(position.latitude.toString());
      log(position.longitude.toString());

      return Right(result.timings);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkError());
      }
    }
    return Left(ServerFailure());
  }
}
