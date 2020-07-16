import 'dart:async';


import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beep/core/error/failure.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

const USER_KEY = 'user';
const TOKEN_KEY = 'token';

@injectable
class SigninBloc extends Bloc<SignInEvent, SignInState> {
  ApiInterface apiInterface;

  SigninBloc({@required this.apiInterface}) : super(SignInStateInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield SignInStateAuthenticating();
    yield* event.map(onSubmit: (e) async* {
      final response = await apiInterface.signIn(e.phoneNumber, e.password);
      yield* response.fold((l) async* {
        yield SignInStateError(l);
      }, (r) async* {
        yield SignInStateAuthenticated();
      });
    }, register: (e) async* {
      yield SignInStateInitial();
    });
  }
}
