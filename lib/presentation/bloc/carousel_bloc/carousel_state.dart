
part of 'carousel_bloc.dart';

abstract class CarouselBlocState extends Equatable {
  const CarouselBlocState();

  @override
  List<Object> get props => [];
}

class CarouselEmpty extends CarouselBlocState {}

class CarouselLoading extends CarouselBlocState {}

class CarouselHasData extends CarouselBlocState {
  final List<Carousel> carousel;

  const CarouselHasData(this.carousel);

  @override
  List<Object> get props => [carousel];
}

class CarouselHasError extends CarouselBlocState {
  final String message;
  const CarouselHasError(this.message);

  @override
  List<Object> get props => [message];
}