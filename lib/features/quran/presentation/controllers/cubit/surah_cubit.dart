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
  StreamSubscription? _playerStateSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;

  @override
  Future<void> close() async {
    await _playerStateSubscription?.cancel();
    await _durationSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _audioPlayer?.dispose();
    return super.close();
  }

  void _setupAudioPlayerListeners() {
    _audioPlayer ??= AudioPlayer();

    _playerStateSubscription?.cancel();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();

    _playerStateSubscription = _audioPlayer!.onPlayerStateChanged.listen((
      playerState,
    ) {
      if (state is SurahSuccess) {
        final currentState = state as SurahSuccess;
        emit(currentState.copyWith(audioPlaybackState: playerState));
      }
    });

    _durationSubscription = _audioPlayer!.onDurationChanged.listen((duration) {
      if (state is SurahSuccess) {
        final currentState = state as SurahSuccess;
        emit(currentState.copyWith(audioDuration: duration));
      }
    });

    _positionSubscription = _audioPlayer!.onPositionChanged.listen((position) {
      if (state is SurahSuccess) {
        final currentState = state as SurahSuccess;
        emit(currentState.copyWith(audioPosition: position));
      }
    });
  }

  Future<void> playAudio(String audioUrl) async {
    _setupAudioPlayerListeners();

    if (state is SurahSuccess) {
      final currentState = state as SurahSuccess;
      emit(currentState.copyWith(isAudioLoading: true));
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
        emit(currentState.copyWith(isAudioLoading: false));
      }
    }
  }

  Future<void> pauseAudio() async {
    await _audioPlayer?.pause();
  }

  Future<void> resumeAudio() async {
    await _audioPlayer?.resume();
  }

  Future<void> stopAudio() async {
    await _audioPlayer?.stop();
  }

  Future<void> seekAudio(Duration position) async {
    await _audioPlayer?.seek(position);
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
      emit(currentState.copyWith(selectedReciter: reciter));
    }
  }
}
