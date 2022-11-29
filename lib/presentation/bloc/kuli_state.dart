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
}

class KuliHasError extends KuliBlocState {
  final String message;
  const KuliHasError(this.message);

  @override
  List<Object> get props => [message];
}


