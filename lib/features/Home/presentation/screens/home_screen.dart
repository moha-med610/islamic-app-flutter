import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/features/prayers/presentation/controllers/cubit/prayer_cubit.dart';
import 'package:islamic_app/features/prayers/presentation/screens/prayer_screen.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';
import 'package:islamic_app/features/quran/presentation/screens/quran_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<QuranCubit>(
              create: (_) => di<QuranCubit>()..getQuran(),
            ),
            BlocProvider<PrayerCubit>(
              create: (_) => di<PrayerCubit>()..getPrayerTimes(),
            ),
          ],
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: Colors.grey.shade900,
              activeColor: Colors.blue.shade900,
              inactiveColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedBookOpen01),
                  label: 'القرآن الكريم',
                ),
                BottomNavigationBarItem(
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedTimeSetting03),
                  label: 'مواقيت الصلاه',
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return const QuranScreen();
                case 1:
                  return const PrayerScreen();
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
        // selectedItemColor: Colors.blue.shade900,
        // unselectedItemColor: Colors.white60,
        // currentIndex: _currentIndex,
        // onTap: _onNavBarTapped,
        // items: const [
        //   BottomNavigationBarItem(
        //     icon: HugeIcon(icon: HugeIcons.strokeRoundedBookOpen01),
        //     label: 'القرآن الكريم',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: HugeIcon(icon: HugeIcons.strokeRoundedTimeSetting03),
        //     label: 'مواقيت الصلاه',
        //   ),
        // ],
      ),
    );
  }
}
