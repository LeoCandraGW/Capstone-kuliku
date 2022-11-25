import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  CustomerModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  int id;
  String username;
  String email;
  String password;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
      };

  Customer toEntity() {
    return Customer(
        id: this.id,
        username: this.username,
        email: this.email,
        password: this.password);
  }

  @override
  List<Object?> get props => [id, username, email, password];
}
