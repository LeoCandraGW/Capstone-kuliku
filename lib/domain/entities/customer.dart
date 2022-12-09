import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  Customer({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.password,
  });
  int id;
  String? username;
  String? email;
  String? image;
  String? password;

  @override
  List<Object?> get props => [id, username, email, image, password];
}
