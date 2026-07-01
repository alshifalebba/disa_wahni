import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../infrastructure/database_functions/secure_storage.dart';

class ApiService {
  
  Future<http.Response> get(String url) async {
    final token = await SecureStorageHelper.getToken();

    log("========== GET ==========");
    log("URL : $url");
    log("Token : $token");

    return await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Basic $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  Future<http.Response> post(
    String url,
    Map<String, dynamic> body, {
    bool needToken = true,
  }) async {
    String? token;

    if (needToken) {
      token = await SecureStorageHelper.getToken();
    }

    log("========== POST ==========");
    log("URL : $url");

    if (needToken) {
      log("Authorization : Basic $token");
    }

    // log("Request Body");
    // log(jsonEncode(body));

    final response = await http.post(
      Uri.parse(url),
      headers: {
        if (needToken) "Authorization": "Basic $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    // log("========== RESPONSE ==========");
    // log("Status : ${response.statusCode}");
    // log(response.body);
    // log("==============================");

    return response;
  }
}