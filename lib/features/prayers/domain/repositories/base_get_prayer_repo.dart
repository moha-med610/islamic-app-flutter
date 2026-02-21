import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';

abstract class BaseGetPrayerRepo {
  Future<Either<Failure, PrayerTimeEntity>> getPrayer();
}
