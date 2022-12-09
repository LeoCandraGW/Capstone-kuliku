
part of 'carousel_bloc.dart';

abstract class CarouselBlocEvent extends Equatable {
  const CarouselBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchCarouselList extends CarouselBlocEvent{}