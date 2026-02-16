part of 'surah_cubit.dart';

@immutable
sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahSuccess extends SurahState {
  final SurahEntity data;
  final String? selectedReciter;
  final bool isAudioLoading;

  SurahSuccess({
    required this.data,
    this.selectedReciter,
    this.isAudioLoading = false,
  });
}

final class SurahError extends SurahState {
  final Failure failure;

  SurahError({required this.failure});
}
