part of 'kuli_bloc.dart';

abstract class KuliBlocEvent extends Equatable {
  const KuliBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchKuliList extends KuliBlocEvent{}
class FetchDetailKuli extends KuliBlocEvent {
  final int id;
  const FetchDetailKuli(this.id);

  @override
  List<Object> get props => [id];
}