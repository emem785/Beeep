import 'dart:async';
import 'dart:convert';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/domain/Interface/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beep/infrastructure/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalStorageInterface localStorageInterface;
  final ApiInterface apiInterface;

  UserBloc({@required this.localStorageInterface, @required this.apiInterface});

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield UserUpdating();
    yield* event.map(insertUser: (e) async* {
      final user = await localStorageInterface.getUser();
      yield* user.fold((l) async* {
        UserError(l);
      }, (r) async* {
        yield UserLoaded(User.fromJson(jsonDecode(r)));
      });
    }, updateUser: (e) async* {
      final response = await apiInterface.updateUser(
          e.firstName, e.lastName, e.email, e.phoneNumber, e.twitterHandle);
      yield* response.fold((l) async* {
        yield UserError(l);
      }, (r) async* {
        // await localStorageInterface.cacheUser(jsonEncode(r));
        //TODO:Implement cache updated  details
        yield UserUpdated("User Updated");
      });
    }, addBuddy: (e) async* {
      final response = await apiInterface.addBuddy(
          e.firstName, e.lastName, e.phoneNumber, e.relationship);
      yield* response.fold((l) async* {
        yield UserError(l);
      }, (r) async* {
        yield UserUpdated("Buddy Added");
      });
    });
  }
}