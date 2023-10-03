// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_app/src/authentication/data/model/request/login_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/response/auth_response_model.dart';
import 'package:restaurant_app/src/authentication/data/repositories/auth_repositories.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositories authRepositories;
  LoginBloc(
    this.authRepositories,
  ) : super(const _Initial()) {
    on<_Verif>((event, emit) async {
      emit(const _Loading());
      final result = await authRepositories.login(event.loginData);
      result.fold(
        (l) => emit(_Error(error: l)),
        (r) => emit(_Success(loginData: r)),
      );
    });
  }
}
