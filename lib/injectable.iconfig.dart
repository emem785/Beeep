// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:beep/infrastructure/register_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
import 'package:beep/infrastructure/repositories/map_helper_impl.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/application/blocs/register_bloc/register_bloc.dart';
import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:beep/application/blocs/user_bloc/user_bloc.dart';
import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerModule = _$RegisterModule();
  g.registerFactory<FirebaseMessaging>(() => registerModule.firebaseMessaging);
  g.registerFactory<Geolocator>(() => registerModule.geolocator);
  g.registerLazySingleton<LocalStorageInterface>(() => LocalStorageImpl());
  g.registerFactory<NavigationBloc>(() => NavigationBloc());
  g.registerLazySingleton<NetworkInterface>(() =>
      NetworkClientImpl(localStorageInterface: g<LocalStorageInterface>()));
  g.registerFactory<UserLocationInterface>(
      () => UserLocationImpl(geolocator: g<Geolocator>()));
  g.registerLazySingleton<ApiInterface>(() => HttpApiImpl(
      localStorageRepo: g<LocalStorageInterface>(),
      client: g<NetworkInterface>()));
  g.registerFactory<AuthBloc>(
      () => AuthBloc(localStorageInterface: g<LocalStorageInterface>()));
  g.registerFactory<LawyerBloc>(
      () => LawyerBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<LawyerTilesCubit>(
      () => LawyerTilesCubit(apiInterface: g<ApiInterface>()));
  g.registerFactory<MapInterface>(() => MapHelperImpl(
      apiInterface: g<ApiInterface>(),
      userLocationInterface: g<UserLocationInterface>()));
  g.registerFactory<RegisterBloc>(
      () => RegisterBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<SigninBloc>(
      () => SigninBloc(apiInterface: g<ApiInterface>()));
  g.registerFactory<UserBloc>(() => UserBloc(
      localStorageInterface: g<LocalStorageInterface>(),
      apiInterface: g<ApiInterface>()));
  g.registerFactory<AddressBloc>(() => AddressBloc(
        apiInterface: g<ApiInterface>(),
        localStorageInterface: g<LocalStorageInterface>(),
        userLocationInterface: g<UserLocationInterface>(),
      ));
  g.registerFactory<LocationBloc>(() => LocationBloc(
        mapInterface: g<MapInterface>(),
        userLocation: g<UserLocationInterface>(),
        apiInterface: g<ApiInterface>(),
      ));
  g.registerFactory<MapBloc>(() => MapBloc(
        userLocationInterface: g<UserLocationInterface>(),
        mapInterface: g<MapInterface>(),
        apiInterface: g<ApiInterface>(),
        localStorageInterface: g<LocalStorageInterface>(),
      ));
}

class _$RegisterModule extends RegisterModule {}
