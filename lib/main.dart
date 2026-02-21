import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/service/cache_service.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/islamic_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection
  DiService.init();
  // Cache
  await LocalDataService.init();

  // intl arabic init
  await initializeDateFormatting('ar');

  runApp(
    // Change Status Bar Color
    const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2C2C2C),
        statusBarIconBrightness: Brightness.light,
      ),
      // App Entry
      child: IslamicApp(),
    ),
  );
}
