import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quran/presentation/controllers/cubit/surah_cubit.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({super.key});

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is! SurahSuccess) {
          return const SizedBox.shrink();
        }

        final audioMap = state.data.audio;

        if (audioMap.isEmpty) {
          return const SizedBox.shrink();
        }

        final audioList = audioMap.values.toList();

        final selectedUrl =
            audioList.any((audio) => audio.url == state.selectedReciter)
            ? state.selectedReciter
            : null;

        final isPlaying = state.audioPlaybackState == PlayerState.playing;
        final isPaused = state.audioPlaybackState == PlayerState.paused;
        final audioPosition = state.audioPosition ?? Duration.zero;
        final audioDuration = state.audioDuration ?? Duration.zero;

        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFF0D0D0D), Color(0xFF121A2A), Color(0xFF0A2540)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.blue.withOpacity(0.25), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.15),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              ),
              const BoxShadow(
                color: Colors.black54,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "اختر القارئ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.blue.withOpacity(0.35)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedUrl,
                    isExpanded: true,
                    dropdownColor: const Color(0xFF0B1622),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.blueAccent,
                    ),
                    hint: const Text(
                      "اختر قارئ",
                      style: TextStyle(color: Colors.white60),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    items: audioList.map((audio) {
                      return DropdownMenuItem<String>(
                        value: audio.url,
                        child: Text(
                          audio.reciter,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<SurahCubit>().selectReciter(value);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              if (isPlaying || isPaused) ...[
                Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 6,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                          elevation: 4,
                        ),
                        activeTrackColor: Colors.blueAccent,
                        inactiveTrackColor: Colors.grey.shade700,
                      ),
                      child: Slider(
                        activeColor: Colors.blue.shade800,
                        value: audioPosition.inSeconds.toDouble(),
                        max: audioDuration.inSeconds.toDouble() > 0
                            ? audioDuration.inSeconds.toDouble()
                            : 1.0,
                        onChanged: (value) {
                          context.read<SurahCubit>().seekAudio(
                            Duration(seconds: value.toInt()),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(audioPosition),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _formatDuration(audioDuration),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: selectedUrl == null || state.isAudioLoading
                      ? null
                      : () {
                          if (isPlaying) {
                            context.read<SurahCubit>().pauseAudio();
                          } else if (isPaused) {
                            context.read<SurahCubit>().resumeAudio();
                          } else {
                            context.read<SurahCubit>().playAudio(selectedUrl);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: selectedUrl == null
                        ? Colors.grey.shade800
                        : const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: state.isAudioLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 26,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isPlaying
                                  ? "إيقاف مؤقت"
                                  : isPaused
                                  ? "استئناف التلاوة"
                                  : "تشغيل التلاوة",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
