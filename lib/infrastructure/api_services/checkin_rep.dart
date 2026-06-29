import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:loginpage/core/cloud/cloud.dart';
import 'package:loginpage/domain/checkin/checkin_model.dart';
import 'package:loginpage/infrastructure/api_services/api_services.dart';

class CheckinRepository {
  final ApiService api;

  CheckinRepository(this.api);

  static const checkinUrl = "$BASE_URL.employee.employee_checkin";

  Future<void> submit(CheckinRequest request) async {
    final selfieBase64 = base64Encode(await request.selfieImage.readAsBytes());

    final odometerBase64 = base64Encode(
      await request.odometerImage.readAsBytes(),
    );

    final body = {
      "log_type": request.logType,
      "image": selfieBase64,
      "image_odo": odometerBase64,
      "file_type": "jpg",
      "odometer_value": request.odometerValue,
      "latitude": request.latitude.toString(),
      "longitude": request.longitude.toString(),
      "time": DateTime.now().toIso8601String(),
    };

    final response = await api.post(checkinUrl, body);

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final data = jsonDecode(response.body);

    if (data["message"] != null && data["message"]["success"] == false) {
      throw Exception(data["message"]["message"]);
    }
  }

  Future<Position> getLocation() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();

    if (!enabled) {
      throw Exception("Location Service Disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception("Permission Denied");
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Permission Denied Forever");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
