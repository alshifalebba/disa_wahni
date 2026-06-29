import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/core/secure_storage.dart';
import 'package:loginpage/features/home/data/model/checkin_model.dart';

class CheckinRepository {
  static const String url =
      "https://disa-uat.m.frappe.cloud/api/method/disa_backend.api.v1.employee.employee_checkin";

  Future<void> submit(CheckinRequest request) async {
    final token = await SecureStorageHelper.getToken();

    if (token == null || token.isEmpty) {
      throw Exception("Authentication token not found.");
    }

    // Convert images to Base64
    final selfieBytes = await request.selfieImage.readAsBytes();
    final odometerBytes = await request.odometerImage.readAsBytes();

    final selfieBase64 = base64Encode(selfieBytes);
    final odometerBase64 = base64Encode(odometerBytes);

    // Logs
    // log("========== BASE64 LOG ==========");
    // log("Selfie Base64 Length: ${selfieBase64.length}");
    // log("Odometer Base64 Length: ${odometerBase64.length}");

    // // Print only the beginning of the string (don't print the entire Base64)
    // log("Selfie Base64 : ${selfieBase64}");
    // log("================================");

    // JSON Body
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

    log("========== REQUEST ==========");
    log("URL              : $url");
    log("Authorization    : Basic $token");
    log("Log Type         : ${request.logType}");
    log("Odometer Value   : ${request.odometerValue}");
    log("Latitude         : ${request.latitude}");
    log("Longitude        : ${request.longitude}");
    log("Time             : ${DateTime.now().toIso8601String()}");
    log("JSON Body:");
    log(jsonEncode(body));
    log("=============================");

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Basic $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    log("========== RESPONSE ==========");
    log("Status Code : ${response.statusCode}");
    log(response.body);
    log("==============================");

    if (response.statusCode != 200) {
      throw Exception(
        "Check-In Failed\nStatus: ${response.statusCode}\n${response.body}",
      );
    }

    final data = jsonDecode(response.body);

    // API success check
    if (data["message"] != null && data["message"]["success"] == false) {
      throw Exception(data["message"]["message"]);
    }
  }

  Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location Service Disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception("Location Permission Denied");
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location Permission Denied Forever");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
