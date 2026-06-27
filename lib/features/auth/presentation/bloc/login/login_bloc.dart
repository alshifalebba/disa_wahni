import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/features/auth/presentation/bloc/login/login_event.dart';
import 'package:loginpage/features/auth/presentation/bloc/login/login_state.dart';
import 'package:loginpage/features/auth/repository/authservice.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        final response = await repository.login(
          username: event.username,
          password: event.password,
        );

        if (response.success) {
          emit(LoginSuccess(response));
        } else {
          emit(LoginFailure(response.message));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}