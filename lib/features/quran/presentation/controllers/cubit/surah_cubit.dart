import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surah_usecase.dart';
import 'package:meta/meta.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.getSurahUseCase) : super(SurahInitial());

  final GetSurahUseCase getSurahUseCase;
  AudioPlayer? _audioPlayer;
  String? _selectedReciter;

  Future<void> playAudio(String audioUrl) async {
    if (state is SurahSuccess) {
      final currentState = state as SurahSuccess;
      emit(
        SurahSuccess(
          data: currentState.data,
          selectedReciter: currentState.selectedReciter,
          isAudioLoading: true,
        ),
      );
    }

    try {
      _audioPlayer ??= AudioPlayer();
      await _audioPlayer!
          .play(UrlSource(audioUrl))
          .timeout(Duration(minutes: 1));
    } on TimeoutException catch (e) {
      print(e);
      throw SurahError(failure: NetworkError());
    } finally {
      if (state is SurahSuccess) {
        final currentState = state as SurahSuccess;
        emit(
          SurahSuccess(
            data: currentState.data,
            selectedReciter: currentState.selectedReciter,
            isAudioLoading: false,
          ),
        );
      }
    }
  }

  Future<void> stopAudio() async {
    await _audioPlayer?.stop();
  }

  Future<void> getSurah(int num) async {
    emit(SurahLoading());

    final result = await getSurahUseCase(num);

    if (isClosed) return;

    result.fold((failure) => emit(SurahError(failure: failure)), (data) {
      _selectedReciter = null;
      emit(
        SurahSuccess(
          data: data,
          selectedReciter: _selectedReciter,
          isAudioLoading: false,
        ),
      );
    });
  }

  void selectReciter(String reciter) {
    _selectedReciter = reciter;
    if (state is SurahSuccess) {
      final currentState = state as SurahSuccess;
      emit(
        SurahSuccess(
          data: currentState.data,
          selectedReciter: reciter,
          isAudioLoading: currentState.isAudioLoading,
        ),
      );
    }
  }
}
