import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:equatable/equatable.dart';

class KuliModel extends Equatable {
  const KuliModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.skill,
    required this.nohp,
    required this.dailysal,
    required this.image,
    required this.deskripsi,
    required this.nik,
    required this.alamat,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String username;
  final String email;
  final String password;
  final String skill;
  final String nohp;
  final String dailysal;
  final String image;
  final String deskripsi;
  final String nik;
  final String alamat;
  final dynamic rememberToken;
  final String createdAt;
  final String updatedAt;

  factory KuliModel.fromJson(Map<String, dynamic> json) => KuliModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        skill: json["skill"],
        nohp: json["nohp"],
        dailysal: json["dailysal"],
        image: json["image"],
        deskripsi: json["deskripsi"],
        nik: json["nik"],
        alamat: json["alamat"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "skill": skill,
        "nohp": nohp,
        "dailysal": dailysal,
        "image": image,
        "deskripsi": deskripsi,
        "nik": nik,
        "alamat": alamat,
        "remember_token": rememberToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Kuli toEntity() {
    return Kuli(
        alamat: this.alamat,
        dailysal: this.dailysal,
        deskripsi: this.deskripsi,
        email: this.alamat,
        id: this.id,
        image: this.image,
        nohp: this.nohp,
        nik: this.nik,
        password: this.password,
        skill: this.skill,
        username: this.username);
  }

  @override
  List<Object?> get props => [
        alamat,
        dailysal,
        deskripsi,
        alamat,
        id,
        image,
        nohp,
        nik,
        password,
        skill,
        username,
      ];
}
