import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/application/auth/auth_bloc.dart';
import 'package:loginpage/presentation/login/login.dart';
import 'package:loginpage/presentation/home/home.dart';
//simport 'package:loginpage/features/home/presentation/pages/home_tab.dart';
//import 'package:loginpage/features/home/presentation/pages/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return state.isAuthenticated
            ? const HomePage()
            : const LoginScreen();
      },
    );
  }
}