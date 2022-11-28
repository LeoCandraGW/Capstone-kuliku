import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:equatable/equatable.dart';

class KuliModel extends Equatable{
    KuliModel({
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

    int id;
    String username;
    String email;
    String password;
    String skill;
    String nohp;
    String dailysal;
    String image;
    String deskripsi;
    String nik;
    String alamat;

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

    Kuli toEntity() {
      return Kuli(
        id: this.id,
        username: this.username,
        email: this.email,
        password: this.password,
        skill: this.skill,
        nohp: this.nohp,
        dailysal: this.dailysal,
        image: this.image,
        deskripsi: this.deskripsi,
        nik: this.nik,
        alamat: this.alamat,
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
