// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:beep/infrastructure/register_module.dart';
import 'package:geolocator/geolocator.dart';
import 'package:beep/infrastructure/repositories/local_storage_impl.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/application/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:beep/infrastructure/repositories/network_client_impl.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/infrastructure/repositories/user_location_impl.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/repositories/http_api_impl.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/application/blocs/register_bloc/register_bloc.dart';
import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:beep/application/blocs/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerModule = _$RegisterModule();
  g.registerFactory<Geolocator>(() => registerModule.geolocator);
  g.registerLazySingleton<LocalStorageInterface>(() => LocalStorageImpl());
  g.registerFactory<NavigationBloc>(() => NavigationBloc());
  g.registerLazySingleton<NetworkInterface>(
      () => NetworkClientImpl(localStorageInterface: g<LocalStorageInterface>()));
  g.registerFactory<UserLocationInterface>(
      () => UserLocationImpl(geolocator: g<Geolocator>()));
  g.registerLazySingleton<ApiInterface>(() => HttpApiImpl(
      localStorageRepo: g<LocalStorageInterface>(),
      client: g<NetworkInterface>()));
  g.registerFactory<AuthBloc>(
      () => AuthBloc(localStorageInterface: g<LocalStorageInterface>()));
  g.registerFactory<LawyerBloc>(
      () => LawyerBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<LocationBloc>(() => LocationBloc(
      userLocation: g<UserLocationInterface>(), apiInterface: g<ApiInterface>()));
  g.registerFactory<MapBloc>(() => MapBloc(
        userLocation: g<UserLocationInterface>(),
        apiInterface: g<ApiInterface>(),
        localStorageInterface: g<LocalStorageInterface>(),
      ));
  g.registerFactory<RegisterBloc>(
      () => RegisterBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<SigninBloc>(
      () => SigninBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<UserBloc>(() => UserBloc(
      localStorageInterface: g<LocalStorageInterface>(),
      apiInterface: g<ApiInterface>()));
}

class _$RegisterModule extends RegisterModule {}
