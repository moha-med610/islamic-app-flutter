import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';
import 'package:islamic_app/features/prayers/domain/repositories/base_get_prayer_repo.dart';

class GetPrayerUseCase {
  final BaseGetPrayerRepo repo;

  GetPrayerUseCase(this.repo);
  Future<Either<Failure, PrayerTimeEntity>> call() async {
    return await repo.getPrayer();
  }
}
