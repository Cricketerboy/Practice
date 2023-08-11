import 'package:flutter/material.dart';

class PersonalChat {
  String? profileImage;
  String? userName;
  String? message;
  String? timeSent;

  PersonalChat({
    required this.profileImage,
    required this.userName,
    required this.message,
    required this.timeSent,
  });

  factory PersonalChat.fromJson(Map<String, dynamic> json) {
    return PersonalChat(
      profileImage: json["profileImage"],
      userName: json["userName"],
      message: json["message"],
      timeSent: json["timeSent"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["profileImage"] = this.profileImage;
    data["userName"] = this.userName;
    data["message"] = this.message;
    data["timeSent"] = this.timeSent;

    return data;
  }
}
