import 'package:bloc/bloc.dart';
import 'package:islamic_app/core/errors/failure.dart';
import 'package:islamic_app/features/quran/domain/entities/quran_entity.dart';
import 'package:islamic_app/features/quran/domain/entities/surah_entity.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_quran_usecase.dart';
import 'package:meta/meta.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.getQuranUseCase) : super(QuranInitial());

  final GetQuranUseCase getQuranUseCase;

  Future<void> getQuran() async {
    emit(Loading());

    final result = await getQuranUseCase();

    if (isClosed) return;

    result.fold(
      (failure) => emit(Error(failure: failure)),
      (data) => emit(SuccessQuran(quran: data)),
    );
  }
}
