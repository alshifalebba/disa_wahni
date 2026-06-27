abstract class LoginEvent {}

class LoginPressed extends LoginEvent {
  final String username;
  final String password;

  LoginPressed({
    required this.username,
    required this.password,
  });
}