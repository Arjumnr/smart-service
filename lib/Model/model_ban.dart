// To parse this JSON data, do
//
//     final ban = banFromJson(jsonString);

import 'dart:convert';

Ban banFromJson(String str) => Ban.fromJson(json.decode(str));

String banToJson(Ban data) => json.encode(data.toJson());

class Ban {
  Ban({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory Ban.fromJson(Map<String, dynamic> json) => Ban(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.merkBan,
    required this.deskripsiBan,
    required this.waktuBan,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String merkBan;
  String deskripsiBan;
  String waktuBan;
  DateTime createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        merkBan: json["merk_ban"],
        deskripsiBan: json["deskripsi_ban"],
        waktuBan: json["waktu_ban"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk_ban": merkBan,
        "deskripsi_ban": deskripsiBan,
        "waktu_ban": waktuBan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
