import 'dart:io';

class CheckinRequest {
  final String logType;
  final String odometerValue;
  final File selfieImage;
  final File? odometerImage;
  final double latitude;
  final double longitude;

  CheckinRequest({
    required this.logType,
    required this.odometerValue,
    required this.selfieImage,
    this.odometerImage,
    required this.latitude,
    required this.longitude,
  });
}