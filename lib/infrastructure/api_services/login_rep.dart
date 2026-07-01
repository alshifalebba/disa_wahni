import 'dart:convert';
import 'dart:developer';
import 'package:loginpage/core/cloud/cloud.dart';
import 'package:loginpage/domain/login/loginmodel.dart';
import 'package:loginpage/domain/user_details/user_model.dart';
import 'package:loginpage/infrastructure/api_services/api_services.dart';
import 'package:loginpage/infrastructure/database_functions/hive_helper.dart';
import 'package:loginpage/infrastructure/database_functions/secure_storage.dart';

class AuthRepository {
  final ApiService api;

  AuthRepository(this.api);
  static const loginUrl = "$BASE_URL.v1.auth.authenticate";

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await api.post(loginUrl, {
        "username": username,
        "password": password,
      }, needToken: false);

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));

      if (loginResponse.success) {
        await SecureStorageHelper.saveToken(loginResponse.token);

        await saveUserDetails(loginResponse);
      }

      return loginResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
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
    return HiveHelper.getUserData();
  }

  Future<void> logout() async {
    await SecureStorageHelper.logout();
    await HiveHelper.clearUserData();
  }
}
