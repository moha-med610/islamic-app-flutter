part of 'prayer_cubit.dart';

@immutable
sealed class PrayerState {}

final class PrayerInitial extends PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerSuccess extends PrayerState {
  final PrayerTimeEntity data;

  PrayerSuccess({required this.data});
}

final class PrayerError extends PrayerState {
  final Failure failure;

  PrayerError({required this.failure});
}
