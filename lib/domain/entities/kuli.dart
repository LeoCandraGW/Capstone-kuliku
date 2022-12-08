import 'package:equatable/equatable.dart';

class Kuli extends Equatable {
  Kuli({
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
  });

  Kuli.favorite(
      {required this.id,
      required this.username,
      required this.dailysal,
      required this.image,
      required this.alamat});

  int? id;
  String? username;
  String? email;
  String? password;
  String? skill;
  String? nohp;
  String? dailysal;
  String image;
  String? deskripsi;
  String? nik;
  String? alamat;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
        skill,
        nohp,
        dailysal,
        image,
        deskripsi,
        nik,
        alamat,
      ];
}
