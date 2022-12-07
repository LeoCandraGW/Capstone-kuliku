import 'package:capstone_kuliku/domain/usecases/get_kuli_detail.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_skill.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/kuli.dart';
import '../../domain/entities/kuli_detail.dart';
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
class DetailKuliBloc extends Bloc<KuliBlocEvent, KuliBlocState> {
  final GetDetailKuli _getDetailKuli;
  DetailKuliBloc(this._getDetailKuli) : super(KuliLoading()) {
    on<FetchDetailKuli>((event, emit) async {
      final id = event.id;
      emit(KuliLoading());
      final result = await _getDetailKuli.execute(id);
      result.fold((failure) {
        emit(KuliHasError(failure.message));
      }, (data) {
        emit(KuliDetailHasData(data));
      });
    });
  }
}
class GetKuliSkillListBloc extends Bloc<KuliBlocEvent, KuliBlocState> {
  final GetKuliSkillList _getKuliSkillList;
  GetKuliSkillListBloc(this._getKuliSkillList) : super(KuliLoading()) {
    on<FetchKuliSkillList>((event, emit) async {
      final skill = event.skill;
      emit(KuliLoading());
      final result = await _getKuliSkillList.execute(skill);
      result.fold((failure) {
        emit(KuliHasError(failure.message));
      }, (data) {
        emit(KuliSkillHasData(data));
      });
    });
  }
}
