class CheckinHiveModel {
  final String vehicleType;
  final String odometerValue;
  final String? odometerImage;

  final String checkInTime;
  final String? checkOutTime;

  final bool isCheckedIn;

  CheckinHiveModel({
    required this.vehicleType,
    required this.odometerValue,
    this.odometerImage,
    required this.checkInTime,
    this.checkOutTime,
    required this.isCheckedIn,
  });

  Map<String, dynamic> toJson() {
    return {
      "vehicleType": vehicleType,
      "odometerValue": odometerValue,
      "odometerImage": odometerImage,
      "checkInTime": checkInTime,
      "checkOutTime": checkOutTime,
      "isCheckedIn": isCheckedIn,
    };
  }

  factory CheckinHiveModel.fromJson(Map<String, dynamic> json) {
    return CheckinHiveModel(
      vehicleType: json["vehicleType"] ?? "",
      odometerValue: json["odometerValue"] ?? "",
      odometerImage: json["odometerImage"],
      checkInTime: json["checkInTime"] ?? "",
      checkOutTime: json["checkOutTime"],
      isCheckedIn: json["isCheckedIn"] ?? false,
    );
  }

  CheckinHiveModel copyWith({
    String? vehicleType,
    String? odometerValue,
    String? odometerImage,
    String? checkInTime,
    String? checkOutTime,
    bool? isCheckedIn,
  }) {
    return CheckinHiveModel(
      vehicleType: vehicleType ?? this.vehicleType,
      odometerValue: odometerValue ?? this.odometerValue,
      odometerImage: odometerImage ?? this.odometerImage,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
    );
  }
}