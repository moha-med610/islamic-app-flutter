import 'package:get_it/get_it.dart';
import 'package:islamic_app/features/quran/di/quran_di.dart';

final GetIt di = GetIt.instance;

class DiService {
  static Future<void> init() async {
    await QuranDi.initQuran();
  }
}
