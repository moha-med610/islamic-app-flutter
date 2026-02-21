import 'package:dio/dio.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/features/prayers/data/datasource/location_data_source.dart';
import 'package:islamic_app/features/prayers/data/datasource/prayer_data_source.dart';
import 'package:islamic_app/features/prayers/data/repositories/get_prayer_repo_impl.dart';
import 'package:islamic_app/features/prayers/domain/repositories/base_get_prayer_repo.dart';
import 'package:islamic_app/features/prayers/domain/usecases/get_prayer_usecase.dart';
import 'package:islamic_app/features/prayers/presentation/controllers/cubit/prayer_cubit.dart';

class PreyerDi {
  static Future<void> initPreyer() async {
    // dio
    di<Dio>();

    // data source
    di.registerLazySingleton(() => LocationDataSource());
    di.registerLazySingleton(() => PrayerDataSource(di()));

    // repositories
    di.registerLazySingleton<BaseGetPrayerRepo>(
      () => GetPrayerRepoImpl(di(), di()),
    );

    // use case
    di.registerLazySingleton(() => GetPrayerUseCase(di()));

    // cubit
    di.registerFactory(() => PrayerCubit(di()));
  }
}
