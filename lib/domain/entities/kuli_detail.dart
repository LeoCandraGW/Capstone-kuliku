import 'package:equatable/equatable.dart';

class KuliDetail extends Equatable {
  KuliDetail({
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
