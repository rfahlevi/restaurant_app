part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.add({required RegisterRequestModel registerData}) = _Add;
}
