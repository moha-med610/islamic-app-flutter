import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/core/service/cache_service.dart';
import 'package:islamic_app/features/Home/presentation/screens/home_screen.dart';
import 'package:islamic_app/features/onboarding/presentation/screens/onboarding_screen.dart';

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        scaffoldBackgroundColor: Color(0xFF141414),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF141414),
        ),
      ),

      home: LocalDataService.getBool("is_show_Onboarding") != null
          ? HomeScreen()
          : OnBoardingScreen(),
    );
  }
}
