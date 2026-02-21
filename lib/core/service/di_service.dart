import 'package:get_it/get_it.dart';
import 'package:islamic_app/core/service/dio_service.dart';
import 'package:islamic_app/features/prayers/di/prayer_di.dart';
import 'package:islamic_app/features/quran/di/quran_di.dart';

final GetIt di = GetIt.instance;

class DiService {
  static Future<void> init() async {
    await CoreDi.init();
    await QuranDi.initQuran();
    await PreyerDi.initPreyer();
  }
}
