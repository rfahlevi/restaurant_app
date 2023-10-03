import 'package:dartz/dartz.dart';
import 'package:restaurant_app/src/authentication/data/model/request/login_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/request/register_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/response/auth_response_model.dart';
import 'package:restaurant_app/src/authentication/data/remote_datasource/auth_datasource.dart';

class AuthRepositories {
  final _authDatasource = AuthDatasource();

  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel registerData) async {
    return _authDatasource.register(registerData);
  }

  Future<Either<String, AuthResponseModel>> login(LoginRequestModel loginData) async {
    return _authDatasource.login(loginData);
  }
}
