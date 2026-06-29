import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:loginpage/application/auth/auth_bloc.dart';
import 'package:loginpage/presentation/login/authwrapper.dart';
import 'package:loginpage/infrastructure/api_services/authservice.dart';

import 'package:loginpage/infrastructure/api_services/checkin_rep.dart';
import 'package:loginpage/application/checkin/checkin_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('userBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) =>
              AuthBloc(AuthRepository())..add(const AuthEvent.started()),
        ),

        BlocProvider<CheckinBloc>(
          create: (_) => CheckinBloc(CheckinRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper(),
      ),
    );
  }
}
