import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  Carousel({
    required this.id,
    required this.image,
  });
  int id;
  String? image;

  @override
  List<Object?> get props => [id, image];
}
