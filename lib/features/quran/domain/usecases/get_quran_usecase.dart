import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:islamic_app/features/quran/domain/repositories/quran_repo.dart';

class GetQuranUseCase {
  final QuranRepo repo;

  GetQuranUseCase(this.repo);

  Future<Either<Failure, List<QuranEntity>>> call() async {
    return await repo.getQuran();
  }
}
