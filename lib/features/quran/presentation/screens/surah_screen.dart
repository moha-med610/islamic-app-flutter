import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/widgets/error_widget.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/quran_cubit.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/surah_cubit.dart';
import 'package:islamic_app/features/quran/presentation/screens/quran_screen.dart';
import 'package:islamic_app/features/quran/presentation/widgets/audio_widget.dart';
import 'package:islamic_app/features/quran/presentation/widgets/surah_widget.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            if (state is SurahLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 15,
                  color: Colors.white,
                ),
              );
            }

            if (state is SurahError) {
              return ErrorView(() {
                context.read<QuranCubit>().getQuran();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => QuranScreen()),
                );
              });
            }

            if (state is SurahSuccess) {
              return Column(
                children: [
                  AudioWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.data.ayah.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final ayah = state.data.ayah[index];

                        return SurahWidget(ayah: ayah, index: index);
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
