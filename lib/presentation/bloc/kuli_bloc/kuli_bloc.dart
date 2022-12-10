import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/domain/usecases/get_favourite_kuli.dart';
import 'package:capstone_kuliku/domain/usecases/get_favourite_status.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_detail.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_skill.dart';
import 'package:capstone_kuliku/domain/usecases/remove_favourite.dart';
import 'package:capstone_kuliku/domain/usecases/save_favourite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
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
class KuliFavoriteBloc extends Bloc<KuliBlocEvent, KuliBlocState> {
  final GetFavoriteKuli getFavoriteKuli;
  final GetFavoriteStatus getFavoriteStatus;
  final SaveFavorite saveFavorite;
  final RemoveFavorite removeFavorite;

  static const favoriteAddSuccessMessage = 'Added to Favorite';
  static const favoriteRemoveSuccessMessage = 'Removed from Favorite';

  KuliFavoriteBloc(this.getFavoriteKuli, this.getFavoriteStatus,
      this.removeFavorite, this.saveFavorite)
      : super(KuliEmpty()) {
    on<FetchFavoriteKuli>((event, emit) async {
      emit(KuliLoading());
      final result = await getFavoriteKuli.execute();

      result.fold(
        (failure) {
          emit(KuliHasError(failure.message));
        },
        (kuliesData) {
          emit(FavoriteKuliHasData(kuliesData));
        },
      );
    });
    on<AddFavoriteKuli>((event, emit) async {
      final kuli = event.kuli;

      emit(KuliLoading());
      final result = await saveFavorite.execute(kuli);

      result.fold(
        (failure) {
          emit(KuliHasError(failure.message));
        },
        (successMessage) {
          emit(FavoriteKuliMessage(successMessage));
        },
      );
    });
    on<RemoveFavoriteKuli>((event, emit) async {
      final kuli = event.kuli;

      emit(KuliLoading());
      final result = await removeFavorite.execute(kuli);

      result.fold(
        (failure) {
          emit(KuliHasError(failure.message));
        },
        (successMessage) {
          emit(FavoriteKuliMessage(successMessage));
        },
      );
    });
    on<LoadFavoriteKuliStatus>((event, emit) async {
      final id = event.id;
      emit(KuliLoading());
      final result = await getFavoriteStatus.execute(id);

      emit(LoadFavoriteData(result));
    });
  }
}
  
