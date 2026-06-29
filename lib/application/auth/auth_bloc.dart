import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loginpage/infrastructure/database_functions/secure_storage.dart';
import 'package:loginpage/infrastructure/api_services/login_rep.dart';
part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const AuthState()) {
    on<_Started>(_onStarted);
    on<_LoginPressed>(_onLoginPressed);
    on<_LogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {
    final isLoggedIn = await SecureStorageHelper.isLoggedIn();

    emit(state.copyWith(isAuthenticated: isLoggedIn));
  }

  Future<void> _onLoginPressed(
    _LoginPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await repository.login(
        username: event.username,
        password: event.password,
      );

      if (response.success) {
        emit(state.copyWith(isLoading: false, isAuthenticated: true));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: response.message));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onLogoutPressed(
    _LogoutPressed event,
    Emitter<AuthState> emit,
  ) async {
    await repository.logout();

    emit(state.copyWith(isAuthenticated: false));
  }
}
