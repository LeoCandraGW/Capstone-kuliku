part of 'kuli_bloc.dart';

abstract class KuliBlocEvent extends Equatable {
  const KuliBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchKuliList extends KuliBlocEvent {}

class FetchDetailKuli extends KuliBlocEvent {
  final int id;
  const FetchDetailKuli(this.id);

  @override
  List<Object> get props => [id];
}

class FetchFavoriteKuli extends KuliBlocEvent {}

class AddFavoriteKuli extends KuliBlocEvent {
  final KuliDetail kuli;

  const AddFavoriteKuli(this.kuli);
  @override
  List<Object> get props => [kuli];
}

class RemoveFavoriteKuli extends KuliBlocEvent {
  final KuliDetail kuli;

  const RemoveFavoriteKuli(this.kuli);
  @override
  List<Object> get props => [kuli];
}

class LoadFavoriteKuliStatus extends KuliBlocEvent {
  final int id;

  const LoadFavoriteKuliStatus(this.id);

  @override
  List<Object> get props => [id];
}
