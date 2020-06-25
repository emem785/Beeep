import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'core/utils/route_generator.dart';

import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:beep/application/blocs/register_bloc/register_bloc.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'application/blocs/user_bloc/user_bloc.dart';
import 'package:beep/infrastructure/repositories/network_client.dart';
import 'application/blocs/navigation_bloc/navigation_bloc.dart';

import 'package:beep/infrastructure/repositories/local_storage_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:beep/infrastructure/repositories/http_api.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(localStorageInterface: LocalStorageRepo())
                  ..add(AppLoaded()),
          ),
          BlocProvider(
            create: (context) => SigninBloc(
                apiInterface: HttpApiRepository(
                    client: NetworkClient(
                        localStorageInterface: LocalStorageRepo()),
                    localStorageRepo: LocalStorageRepo())),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
                apiInterface: HttpApiRepository(
                    client: NetworkClient(
                        localStorageInterface: LocalStorageRepo()),
                    localStorageRepo: LocalStorageRepo())),
          ),
          BlocProvider(
            create: (_) => UserBloc(
                localStorageInterface: LocalStorageRepo(),
                apiInterface: HttpApiRepository(
                    client: NetworkClient(
                        localStorageInterface: LocalStorageRepo()),
                    localStorageRepo: LocalStorageRepo())),
          ),
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
