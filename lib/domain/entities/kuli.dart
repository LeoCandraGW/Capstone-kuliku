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
    required this.deskripsi,
    required this.nik,
    required this.alamat,
  });

  int id;
  String username;
  String email;
  String password;
  String skill;
  String nohp;
  String dailysal;
  String deskripsi;
  String nik;
  String alamat;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
        skill,
        nohp,
        dailysal,
        deskripsi,
        nik,
        alamat,
      ];
}
