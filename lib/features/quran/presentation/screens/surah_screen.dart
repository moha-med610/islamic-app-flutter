import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/surah_cubit.dart';

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
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SurahError) {
              return Center(
                child: Text(
                  state.failure.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is SurahSuccess) {
              final audioMap = state.data.audio;

              // قائمة URLs فريدة لتجنب الأخطاء
              final audioUrls = audioMap.values
                  .map((reciter) => reciter.originalUrl)
                  .toSet()
                  .toList();

              // تأكد من أن القيمة الحالية موجودة في القائمة
              final selectedReciter = audioUrls.contains(state.selectedReciter)
                  ? state.selectedReciter
                  : null;

              return Column(
                children: [
                  // ===== Audio Controls Section =====
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.teal.shade700, Colors.teal.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'اختر القارئ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedReciter,
                          hint: const Text('اختر قارئ'),
                          dropdownColor: Colors.teal,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.white70,
                          ),
                          items: audioUrls.map((url) {
                            final reciterName = audioMap.values
                                .firstWhere((r) => r.originalUrl == url)
                                .reciter;
                            return DropdownMenuItem<String>(
                              value: url,
                              child: Text(reciterName),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<SurahCubit>().selectReciter(value);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed:
                              selectedReciter != null && !state.isAudioLoading
                              ? () {
                                  final audioUrl = audioMap.values
                                      .firstWhere(
                                        (r) => r.originalUrl == selectedReciter,
                                      )
                                      .url;
                                  context.read<SurahCubit>().playAudio(
                                    audioUrl,
                                  );
                                }
                              : null,
                          icon: state.isAudioLoading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.play_arrow),
                          label: Text(
                            state.isAudioLoading ? 'تحميل...' : 'تشغيل',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal.shade700,
                            disabledBackgroundColor: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===== Ayahs List =====
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.data.ayah.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final ayah = state.data.ayah[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "$ayah ",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "(${index + 1})",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
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
