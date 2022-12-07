part of 'kuli_bloc.dart';

abstract class KuliBlocState extends Equatable {
  const KuliBlocState();

  @override
  List<Object> get props => [];
}

class KuliEmpty extends KuliBlocState {}

class KuliLoading extends KuliBlocState {}

class KuliHasData extends KuliBlocState {
  final List<Kuli> kuli;

  const KuliHasData(this.kuli);

  @override
  List<Object> get props => [kuli];
}

class KuliHasError extends KuliBlocState {
  final String message;
  const KuliHasError(this.message);

  @override
  List<Object> get props => [message];
}

class KuliDetailHasData extends KuliBlocState {
  final KuliDetail kulis;

  const KuliDetailHasData(this.kulis);

  @override
  List<Object> get props => [kulis];
}

class FavoriteKuliHasData extends KuliBlocState {
  final List<Kuli> favoriteKuli;

  const FavoriteKuliHasData(this.favoriteKuli);

  @override
  List<Object> get props => [favoriteKuli];
}

class FavoriteKuliMessage extends KuliBlocState {
  final String message;

  const FavoriteKuliMessage(this.message);
}

class LoadFavoriteData extends KuliBlocState {
  final bool status;

  const LoadFavoriteData(this.status);

  @override
  List<Object> get props => [status];
}
