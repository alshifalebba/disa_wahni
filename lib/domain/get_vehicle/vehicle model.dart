// To parse this JSON data, do
//
//     final getVehicle = getVehicleFromJson(jsonString);

import 'dart:convert';

GetVehicle getVehicleFromJson(String str) => GetVehicle.fromJson(json.decode(str));

String getVehicleToJson(GetVehicle data) => json.encode(data.toJson());

class GetVehicle {
    Message? message;

    GetVehicle({
        this.message,
    });

    factory GetVehicle.fromJson(Map<String, dynamic> json) => GetVehicle(
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
    };
}

class Message {
    List<String>? message;
    bool? success;

    Message({
        this.message,
        this.success,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "success": success,
    };
}
