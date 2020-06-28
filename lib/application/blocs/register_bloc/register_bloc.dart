import 'dart:async';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beep/infrastructure/models/user.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  ApiInterface apiInterface;
  RegisterBloc({this.apiInterface});
  @override
  RegisterState get initialState => RegisterUserInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield RegisterLoading();
    yield* event.map(register: (e) async* {
      final response = await apiInterface.registerUser(
          e.firstName, e.lastName, e.email, e.phoneNumber, e.password);
      yield* response.fold((l) async* {
        yield RegisterError(l);
      }, (r) async* {
        yield RegisterComplete(e.phoneNumber);
      });
    }, getCode: (e) async* {
      final response = await apiInterface.getVerifyCode(e.phoneNumber);
      yield* response.fold((l) async* {
        yield RegisterError(l);
      }, (r) async* {
        yield GetCodeComplete(r.toString());
      });
    }, mobileVerify: (e) async* {
      final response = await apiInterface.mobileVerify(e.phoneNumber, e.code);
      yield* response.fold((l) async* {
        yield RegisterError(l);
      }, (r) async* {
        yield VerifyComplete(r);
      });
    });
  }
}
