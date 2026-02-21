import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/features/prayers/presentation/controllers/cubit/prayer_cubit.dart';
import 'package:islamic_app/features/prayers/presentation/screens/prayer_screen.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';
import 'package:islamic_app/features/quran/presentation/screens/quran_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavBarTapped(int index) {
    _pageController.jumpToPage(index);
  }

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
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [const QuranScreen(), const PrayerScreen()],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.white60,
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
        items: const [
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
    );
  }
}
