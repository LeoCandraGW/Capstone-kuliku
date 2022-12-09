import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:equatable/equatable.dart';

class KuliTable extends Equatable {
  final int id;
  final String? username;
  final String? dailysal;
  final String image;
  final String? alamat;

  KuliTable(
      {required this.id,
      required this.dailysal,
      required this.image,
      required this.username,
      required this.alamat});

  factory KuliTable.fromEntity(KuliDetail kuli) => KuliTable(
      id: kuli.id,
      username: kuli.username,
      image: kuli.image,
      dailysal: kuli.dailysal,
      alamat: kuli.alamat);

  factory KuliTable.fromMap(Map<String, dynamic> map) => KuliTable(
      id: map['id'],
      username: map['username'],
      image: map['image'],
      dailysal: map['dailysal'],
      alamat: map['alamat']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'image': image,
        'dailysal': dailysal,
        'alamat': alamat,
      };

  Kuli toEntity() => Kuli.favorite(
        id: id,
        dailysal: dailysal,
        username: username,
        image: image,
        alamat: alamat,
      );

  @override
  List<Object?> get props => [id, dailysal, username, image, alamat];
}