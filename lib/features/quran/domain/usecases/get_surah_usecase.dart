import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:islamic_app/features/quran/domain/repositories/quran_repo.dart';

class GetSurahUseCase {
  final QuranRepo repo;

  GetSurahUseCase(this.repo);

  Future<Either<Failure, SurahEntity>> call(int id) async {
    return await repo.getSurah(id);
  }
}
