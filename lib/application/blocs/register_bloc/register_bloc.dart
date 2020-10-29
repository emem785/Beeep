import 'dart:async';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
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
  final ApiInterface apiInterface;
  final UserLocationInterface userLocation;
  RegisterBloc({@required this.userLocation, @required this.apiInterface})
      : super(RegisterUserInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield RegisterLoading();
    yield* event.map(register: (e) async* {
      final response =
          await apiInterface.registerUser(user: e.user, password: e.password);
      yield* response.fold((l) async* {
        yield RegisterError(l);
      }, (r) async* {
        yield RegisterComplete(e.user.phone);
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
        final location = await userLocation.getLocation();
        await apiInterface.sendLocation(location.latitude, location.longitude);
        yield VerifyComplete(r);
      });
    });
  }
}
