import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/kuli.dart';
part 'kuli_event.dart';
part 'kuli_state.dart';

class GetKuliListBloc extends Bloc<KuliBlocEvent, KuliBlocState> {
  final GetKuliList _getKuliList;

  GetKuliListBloc(this._getKuliList) : super(KuliLoading()) {
    on<FetchKuliList>((event, emit) async {
      emit(KuliLoading());
      final result = await _getKuliList.execute();
      result.fold((failure) {
        emit(KuliHasError(failure.message));
      }, (kulidata) {
        emit(KuliHasData(kulidata));
      });
    });
  }
}
