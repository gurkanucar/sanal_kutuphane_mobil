// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

List<RoomModel> roomModelFromJson(String str) => List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

String roomModelToJson(List<RoomModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomModel {
  RoomModel({
    this.id,
    this.created,
    this.modified,
    this.roomName,
    this.personCount,
    this.available,
    this.readOnly,
  });

  int id;
  DateTime created;
  DateTime modified;
  String roomName;
  int personCount;
  bool available;
  bool readOnly;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
    id: json["id"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
    roomName: json["roomName"],
    personCount: json["personCount"],
    available: json["available"],
    readOnly: json["readOnly"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created.toIso8601String(),
    "modified": modified.toIso8601String(),
    "roomName": roomName,
    "personCount": personCount,
    "available": available,
    "readOnly": readOnly,
  };
}
