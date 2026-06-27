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

    final apiRequest = http.MultipartRequest("POST", Uri.parse(url));

    //apiRequest.headers.addAll({"Authorization": "token $token"});

    apiRequest.headers.addAll({"Authorization": "Basic $token"});

    //log("Headers: ${apiRequest.headers}");

    apiRequest.fields["log_type"] = request.logType;
    apiRequest.fields["odometer_value"] = request.odometerValue;
    apiRequest.fields["latitude"] = request.latitude.toString();
    apiRequest.fields["longitude"] = request.longitude.toString();
    apiRequest.fields["time"] = DateTime.now().toIso8601String();

    apiRequest.files.add(
      await http.MultipartFile.fromPath("selfie", request.selfieImage.path),
    );

    apiRequest.files.add(
      await http.MultipartFile.fromPath(
        "odometer_image",
        request.odometerImage.path,
      ),
    );

    // log("========== CHECK-IN REQUEST ==========");
    // log("API URL : $url");
    // log("Token : $token");
    // log("Log Type : ${request.logType}");
    // log("Odometer Value : ${request.odometerValue}");
    // log("Latitude : ${request.latitude}");
    // log("Longitude : ${request.longitude}");
    // log("Time : ${DateTime.now().toIso8601String()}");

    // log("Selfie Image Path : ${request.selfieImage.path}");
    // log("Selfie Image Name : ${request.selfieImage.uri.pathSegments.last}");

    // log("Odometer Image Path : ${request.odometerImage.path}");
    // log("Odometer Image Name : ${request.odometerImage.uri.pathSegments.last}");

    // log("Request Fields : ${apiRequest.fields}");

    // log("======================================");

    final response = await apiRequest.send();
    final responseBody = await response.stream.bytesToString();

    log("========== CHECK-IN RESPONSE ==========");
    log("Status Code : ${response.statusCode}");
    log("Response Body : $responseBody");
    log("=======================================");

    if (response.statusCode != 200) {
      throw Exception(
        "Check-In Failed\nStatus: ${response.statusCode}\n$responseBody",
      );
    }

    final data = jsonDecode(responseBody);
    if (data["message"]["success"] == false) {
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

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location Permission Denied Forever");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
