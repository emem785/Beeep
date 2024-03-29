import 'package:beep/injectable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/utils/route_generator.dart';

import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:beep/application/blocs/register_bloc/register_bloc.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'application/blocs/user_bloc/user_bloc.dart';
import 'application/blocs/navigation_bloc/navigation_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()..add(AppLoaded())),
        BlocProvider(create: (context) => getIt<SigninBloc>()),
        BlocProvider(create: (context) => getIt<RegisterBloc>()),
        BlocProvider(create: (_) => getIt<UserBloc>()),
        BlocProvider(create: (_) => NavigationBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Space Mono',
          buttonTheme: ButtonThemeData(minWidth: 366, height: 50),
          primaryColor: Colors.brown,
          textTheme: TextTheme(
            button: TextStyle(fontFamily: 'Nunito', fontSize: 16),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator().generateRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
