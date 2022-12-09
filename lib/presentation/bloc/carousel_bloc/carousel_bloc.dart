import 'package:capstone_kuliku/domain/entities/carousel.dart';
import 'package:capstone_kuliku/domain/usecases/get_carousel_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../kuli_bloc/kuli_bloc.dart';
part 'carousel_event.dart';
part 'carousel_state.dart';

class GetCarouselListBloc extends Bloc<CarouselBlocEvent, CarouselBlocState> {
  final GetCarouselList _getcarouselList;

  GetCarouselListBloc(this._getcarouselList) : super(CarouselLoading()) {
    on<FetchCarouselList>((event, emit) async {
      emit(CarouselLoading());
      final result = await _getcarouselList.execute();
      result.fold((failure) {
        emit(CarouselHasError(failure.message));
      }, (carousel) {
        emit(CarouselHasData(carousel));
      });
    });
  }
}