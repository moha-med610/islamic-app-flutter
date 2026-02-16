import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<QuranEntity>>> getQuran();
  Future<Either<Failure, SurahEntity>> getSurah(int num);
}
