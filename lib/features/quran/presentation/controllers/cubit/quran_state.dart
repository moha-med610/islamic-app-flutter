part of 'quran_cubit.dart';

@immutable
sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class Loading extends QuranState {}

final class SuccessQuran extends QuranState {
  final List<QuranEntity> quran;

  SuccessQuran({required this.quran});
}

final class SuccessSurah extends QuranState {
  final SurahEntity surah;

  SuccessSurah({required this.surah});
}

final class Error extends QuranState {
  final Failure failure;

  Error({required this.failure});
}
