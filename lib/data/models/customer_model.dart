import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  CustomerModel({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.password,
  });

  int id;
  String username;
  String email;
  String image;
  String password;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "image": image,
        "password": password,
      };

  Customer toEntity() {
    return Customer(
        id: this.id,
        username: this.username,
        email: this.email,
        image: this.image,
        password: this.password);
  }

  @override
  List<Object?> get props => [id, username, email, image, password];
}
