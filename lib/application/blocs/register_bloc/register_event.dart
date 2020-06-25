part of 'register_bloc.dart';

@immutable
@freezed
abstract class RegisterEvent with _$RegisterEvent{
  const factory RegisterEvent.register(String firstName, String lastName, String email, String phoneNumber, String password) = RegisterUser;
  const factory RegisterEvent.getCode(String phoneNumber) = GetCode;
  const factory RegisterEvent.mobileVerify(String phoneNumber,String code) = MobileVerify;
}