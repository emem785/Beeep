import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/injectable.dart';
import 'package:beep/presentation/Screens/AppPages/home_screen.dart';
import 'package:beep/presentation/Screens/Authentication/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';

class AuthController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) {
        return state.map(
            initial: (i) => Container(color: Colors.white),
            authenticated: (a) => HomeInitializer(),
            unauthenticated: (u) => SplashScreen());
      },
    );
  }
}
