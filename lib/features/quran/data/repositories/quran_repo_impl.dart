import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/data/datasource/quran_service.dart';
import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:islamic_app/features/quran/domain/repositories/quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranService service;

  QuranRepoImpl(this.service);
  @override
  Future<Either<Failure, List<QuranEntity>>> getQuran() async {
    try {
      final result = await service.getQuran();

      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkError());
      }
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, SurahEntity>> getSurah(int num) async {
    try {
      final result = await service.getSurah(num);

      return Right(result.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkError());
      }
      return Left(UnknownFailure());
    }
  }
}
