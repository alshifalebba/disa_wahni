import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:loginpage/core/cloud/cloud.dart';
import 'package:loginpage/infrastructure/database_functions/hive_helper.dart';
import 'package:loginpage/infrastructure/database_functions/secure_storage.dart';
import 'package:loginpage/domain/login/loginmodel.dart';
import 'package:loginpage/domain/user_details/user_model.dart';

class AuthRepository {
  static const String login_url = "$BASE_URL.auth.authenticate";

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      log("========== LOGIN REQUEST ==========");
      log("URL : $login_url");
      log("Username : $username");

      final response = await http.post(
        Uri.parse(login_url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      log("========== LOGIN RESPONSE ==========");
      log("Status Code : ${response.statusCode}");
      log("Response Body : ${response.body}");
      log("===================================");

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));

        log("========== PARSED LOGIN ==========");
        log("Success : ${loginResponse.success}");
        log("Message : ${loginResponse.message}");
        log("Token : ${loginResponse.token}");
        log("Full Name : ${loginResponse.fullName}");
        log("Designation : ${loginResponse.designation}");
        log("Department : ${loginResponse.department}");
        log("=================================");

        if (loginResponse.success) {
          await SecureStorageHelper.saveToken(loginResponse.token);

          final savedToken = await SecureStorageHelper.getToken();

          log("========== TOKEN SAVED ==========");
          log("Saved Token : $savedToken");
          log("================================");

          await saveUserDetails(loginResponse);
        }

        return loginResponse;
      }

      throw Exception(
        "Login Failed (${response.statusCode})\n${response.body}",
      );
    } catch (e) {
      log("LOGIN ERROR : $e");
      throw Exception(e.toString());
    }
  }

  Future<void> saveUserDetails(LoginResponse response) async {
    final user = UserDataModel(
      fullName: response.fullName,
      designation: response.designation,
      department: response.department,
      mobile: response.mobile,
      salesPerson: response.salesPerson,
      country: response.defaultCountry,
      currency: response.defaultCurrency,
    );

    await HiveHelper.saveUserData(user);
  }

  Future<UserDataModel?> getUserDetails() async {
    return await HiveHelper.getUserData();
  }

  Future<void> logout() async {
    await SecureStorageHelper.logout();
    await HiveHelper.clearUserData();
  }
}
