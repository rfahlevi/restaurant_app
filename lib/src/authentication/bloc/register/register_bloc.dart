// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_app/src/authentication/data/model/request/register_request_model.dart';
import 'package:restaurant_app/src/authentication/data/model/response/auth_response_model.dart';
import 'package:restaurant_app/src/authentication/data/repositories/auth_repositories.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepositories authRepositories;
  RegisterBloc(
    this.authRepositories,
  ) : super(const _Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await authRepositories.register(event.registerData);
      result.fold(
        (l) => emit(_Error(error: l)),
        (r) => emit(_Success(registerData: r)),
      );
    });
  }
}
