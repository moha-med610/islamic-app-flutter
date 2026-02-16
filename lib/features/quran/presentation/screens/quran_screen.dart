import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/service/di_service.dart';
import 'package:islamic_app/core/widgets/error_widget.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';
import 'package:islamic_app/features/quran/presentation/screens/surah_screen.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "القرآن الكريم",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is Error) {
            return ErrorView();
          }

          if (state is Loading) {
            return Skeletonizer(
              enabled: true,
              effect: ShimmerEffect(baseColor: Colors.grey.shade800),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return QuranWidget(
                    isVisible: false,
                    title: "Surah Loading",
                    subTitle: "120",
                    onTap: () {},
                  );
                },
              ),
            );
          }

          if (state is SuccessQuran) {
            return ListView.builder(
              itemCount: state.quran.length,
              itemBuilder: (context, index) {
                final data = state.quran[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QuranWidget(
                    surahNo: index + 1,
                    title: data.surahNameAr,
                    subTitle: data.totalAyah.toString(),
                    onTap: () {
                      final surahNo = index + 1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => di<QuranCubit>()..getSurah(surahNo),
                            child: SurahScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
