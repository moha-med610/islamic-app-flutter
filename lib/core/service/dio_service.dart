import 'package:dio/dio.dart';
import 'package:islamic_app/core/service/di_service.dart';

class CoreDi {
  static Future<void> init() async {
    if (!di.isRegistered<Dio>()) {
      di.registerLazySingleton<Dio>(
        () => Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ),
      );
    }
  }
}
