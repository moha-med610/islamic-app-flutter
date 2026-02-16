import 'package:bloc/bloc.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_quran_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surah_usecase.dart';
import 'package:meta/meta.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.getQuranUseCase, this.getSurahUseCase)
    : super(QuranInitial());

  final GetQuranUseCase getQuranUseCase;
  final GetSurahUseCase getSurahUseCase;

  Future<void> getQuran() async {
    emit(Loading());

    final result = await getQuranUseCase();

    result.fold(
      (failure) => emit(Error(failure: failure)),
      (data) => emit(SuccessQuran(quran: data)),
    );
  }

  Future<void> getSurah(int num) async {
    emit(Loading());

    final result = await getSurahUseCase(num);

    result.fold(
      (failure) => emit(Error(failure: failure)),
      (data) => emit(SuccessSurah(surah: data)),
    );
  }
}
