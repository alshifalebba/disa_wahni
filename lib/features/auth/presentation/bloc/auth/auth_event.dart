part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.loginPressed({
    required String username,
    required String password,
  }) = _LoginPressed;

  const factory AuthEvent.logoutPressed() = _LogoutPressed;
}


