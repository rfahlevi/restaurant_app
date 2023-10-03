import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:restaurant_app/common/constant.dart';
import 'package:restaurant_app/src/authentication/data/local_datasource/auth_local_datasource.dart';
import 'package:restaurant_app/src/authentication/data/model/request/login_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/request/register_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/response/auth_response_model.dart';

class AuthDatasource {
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel registerData) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var body = registerRequestModelToJson(registerData);

    var response = await http.post(Uri.parse('${Constant.baseUrl}/auth/local/register'), headers: headers, body: body);

    var statusCode = response.statusCode;
    var data = response.body;

    debugPrint('$statusCode $data');

    if (statusCode == 200) {
      await AuthLocalDatasource.saveAuthData(authResponseModelFromJson(data));
      return Right(authResponseModelFromJson(data));
    } else {
      return Left('Error $statusCode');
    }
  }

  Future<Either<String, AuthResponseModel>> login(LoginRequestModel loginData) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var body = loginRequestModelToJson(loginData);

    var response = await http.post(Uri.parse('${Constant.baseUrl}/auth/local'), headers: headers, body: body);

    var statusCode = response.statusCode;
    var data = response.body;

    debugPrint('$statusCode $data');

    if (statusCode == 200) {
      await AuthLocalDatasource.saveAuthData(authResponseModelFromJson(data));
      return Right(authResponseModelFromJson(data));
    } else {
      return Left('Error $statusCode');
    }
  }
}
