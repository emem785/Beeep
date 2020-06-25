import 'dart:async';
import 'dart:convert';

import 'package:beep/domain/Interface/storage.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LocalStorageInterface localStorageInterface;
  AuthBloc({this.localStorageInterface});
  @override
  AuthState get initialState => Initial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(appLoaded: (e) async* {
      final user = await localStorageInterface.getUser();
      yield* user.fold((l) async* {
        yield Unauthenticated();
      }, (r) async* {
        yield Authenticated(User.fromJson(jsonDecode(r)));
      });
    }, signOut: (e) async* {
      await localStorageInterface.removeUser();
      await localStorageInterface.removeToken();
    });
  }
}