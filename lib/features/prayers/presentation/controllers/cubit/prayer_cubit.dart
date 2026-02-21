import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/prayers/domain/entities/prayer_time_entity.dart';
import 'package:islamic_app/features/prayers/domain/usecases/get_prayer_usecase.dart';
import 'package:meta/meta.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.getPrayerUseCase) : super(PrayerInitial());

  final GetPrayerUseCase getPrayerUseCase;

  Future<void> getPrayerTimes() async {
    emit(PrayerLoading());

    final result = await getPrayerUseCase();
    result.fold(
      (failure) => emit(PrayerError(failure: failure)),
      (data) => emit(PrayerSuccess(data: data)),
    );
  }
}
