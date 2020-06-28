// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:beep/infrastructure/repositories/local_storage_repo.dart';
import 'package:beep/domain/Interface/storage.dart';
import 'package:beep/application/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:beep/infrastructure/repositories/network_client.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/infrastructure/repositories/http_api.dart';
import 'package:beep/domain/Interface/api.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:beep/application/blocs/register_bloc/register_bloc.dart';
import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:beep/application/blocs/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<LocalStorageInterface>(() => LocalStorageRepo());
  g.registerFactory<NavigationBloc>(() => NavigationBloc());
  g.registerLazySingleton<NetworkInterface>(
      () => NetworkClient(localStorageInterface: g<LocalStorageInterface>()));
  g.registerLazySingleton<ApiInterface>(() => HttpApiRepository(
      localStorageRepo: g<LocalStorageInterface>(),
      client: g<NetworkInterface>()));
  g.registerFactory<AuthBloc>(
      () => AuthBloc(localStorageInterface: g<LocalStorageInterface>()));
  g.registerFactory<RegisterBloc>(
      () => RegisterBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<SigninBloc>(
      () => SigninBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<UserBloc>(() => UserBloc(
      localStorageInterface: g<LocalStorageInterface>(),
      apiInterface: g<ApiInterface>()));
}
