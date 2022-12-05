import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:equatable/equatable.dart';

class KuliDetailModel extends Equatable{
    const KuliDetailModel({
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
    final String? username;
    final String email;
    final String password;
    final String skill;
    final String nohp;
    final String dailysal;
    final String image;
    final String deskripsi;
    final String nik;
    final String alamat;

    factory KuliDetailModel.fromJson(Map<String, dynamic> json) => KuliDetailModel(
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
    };

    KuliDetail toEntity() {
      return KuliDetail(
        id: id,
        username: username,
        email: email,
        password: password,
        skill: skill,
        nohp: nohp,
        dailysal: dailysal,
        image: image,
        deskripsi: deskripsi,
        nik: nik,
        alamat: alamat,
        );
    }
    
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
        alamat
      ];
}