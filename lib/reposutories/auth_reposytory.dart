import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hac_project/constants.dart';
import 'package:hac_project/reposutories/dioApi.dart';

class AuthRepository {
  final String url = "${baseUrl}users/";
  Dio dio = getBaseApi();

  Future<String> createUser({
    required String username,
    required String password,
  }) async {
    try {
      await dio.post(url, queryParameters: {
        "username": username,
        "password": password,
      });
      final token = await login(username: username, password: password);

      return token;
    } on DioError catch (e) {
      log(e.toString());
    }
    return "";
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(url, queryParameters: {
        "username": username,
        "password": password,
      });
      return response.data["auth_token"];
    } on DioError catch (e) {
      log(e.toString());
    }
    return "";
  }
}
