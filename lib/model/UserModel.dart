// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.created,
    this.modified,
    this.username,
    this.email,
    this.online,
    this.lastRoom,
    this.role,
    this.canSendMessage,
    this.reportCount,
  });

  int id;
  DateTime created;
  DateTime modified;
  String username;
  String email;
  bool online;
  int lastRoom;
  String role;
  bool canSendMessage;
  int reportCount;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
    username: json["username"],
    email: json["email"],
    online: json["online"],
    lastRoom: json["lastRoom"],
    role: json["role"],
    canSendMessage: json["canSendMessage"],
    reportCount: json["reportCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created.toIso8601String(),
    "modified": modified.toIso8601String(),
    "username": username,
    "email": email,
    "online": online,
    "lastRoom": lastRoom,
    "role": role,
    "canSendMessage": canSendMessage,
    "reportCount": reportCount,
  };
}
