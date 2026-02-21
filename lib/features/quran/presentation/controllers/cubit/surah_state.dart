part of 'surah_cubit.dart';

@immutable
sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahSuccess extends SurahState {
  final SurahEntity data;
  final String? selectedReciter;
  final bool isAudioLoading;
  final PlayerState? audioPlaybackState;
  final Duration? audioDuration;
  final Duration? audioPosition;

  SurahSuccess({
    required this.data,
    this.selectedReciter,
    this.isAudioLoading = false,
    this.audioPlaybackState,
    this.audioDuration,
    this.audioPosition,
  });

  SurahSuccess copyWith({
    SurahEntity? data,
    String? selectedReciter,
    bool? isAudioLoading,
    PlayerState? audioPlaybackState,
    Duration? audioDuration,
    Duration? audioPosition,
  }) {
    return SurahSuccess(
      data: data ?? this.data,
      selectedReciter: selectedReciter ?? this.selectedReciter,
      isAudioLoading: isAudioLoading ?? this.isAudioLoading,
      audioPlaybackState: audioPlaybackState ?? this.audioPlaybackState,
      audioDuration: audioDuration ?? this.audioDuration,
      audioPosition: audioPosition ?? this.audioPosition,
    );
  }
}

final class SurahError extends SurahState {
  final Failure failure;

  SurahError({required this.failure});
}
