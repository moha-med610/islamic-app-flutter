import 'package:dio/dio.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/features/quran/data/datasource/quran_service.dart';
import 'package:islamic_app/features/quran/data/repositories/quran_repo_impl.dart';
import 'package:islamic_app/features/quran/domain/repositories/quran_repo.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_quran_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surah_usecase.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/surah_cubit.dart';

class QuranDi {
  static Future<void> initQuran() async {
    // cubit
    di.registerFactory<QuranCubit>(() => QuranCubit(di()));
    di.registerFactory<SurahCubit>(() => SurahCubit(di()));

    // use case
    di.registerLazySingleton<GetQuranUseCase>(() => GetQuranUseCase(di()));
    di.registerLazySingleton<GetSurahUseCase>(() => GetSurahUseCase(di()));

    // repo
    di.registerLazySingleton<QuranRepo>(() => QuranRepoImpl(di()));

    // data source
    di.registerLazySingleton<QuranService>(() => QuranService(di()));
    // dio
    di.registerLazySingleton<Dio>(() => Dio());
  }
}
