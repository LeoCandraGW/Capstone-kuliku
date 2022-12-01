// To parse this JSON data, do
//
//     final kuliModel = kuliModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KuliModel kuliModelFromJson(String str) => KuliModel.fromJson(json.decode(str));

String kuliModelToJson(KuliModel data) => json.encode(data.toJson());

class KuliModel {
    KuliModel({
        required this.data,
    });

    Data data;

    factory KuliModel.fromJson(Map<String, dynamic> json) => KuliModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    Datum({
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
    dynamic rememberToken;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Link {
    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    String url;
    String label;
    bool active;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
    };
}
