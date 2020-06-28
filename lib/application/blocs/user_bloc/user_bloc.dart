import 'dart:async';
import 'dart:convert';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beep/infrastructure/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
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
        await localStorageInterface.cacheUser(jsonEncode(r));
        yield UserUpdated("Changes Saved");
      });
    }, addBuddy: (e) async* {
      final response = await apiInterface.addBuddy(
          e.firstName, e.lastName, e.phoneNumber, e.relationship);
      yield* response.fold((l) async* {
        yield UserError(l);
      }, (r) async* {
        yield UserUpdated("Buddy Added");
      });
    }, updatePassword: (e) async* {
      final response = await apiInterface.updatePassword(e.password);
      yield* response.fold((l) async* {
        yield UserError(l);
      }, (r) async* {
        yield UserUpdated("Password Updated");
      });
    });
  }
}
