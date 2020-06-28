import 'dart:async';
import 'dart:core';
import 'package:beep/core/error/failure.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


abstract class ApiInterface {
  Future<Either<Failure, bool>> registerUser(String firstName, String lastName,
      String email, String phoneNumber, String password);

  Future<Either<Failure, String>> getVerifyCode(String phoneNumber);

  Future<Either<Failure, User>> mobileVerify(String phoneNumber, String code);
  Future<Either<Failure, User>> signIn(String phoneNumber, String password);
  Future<Either<Failure, bool>> updatePassword(String password);
  Future<Either<Failure, User>> updateUser(String firstName, String lastName,
      String email, String phoneNumber, String twitterHandle);
  Future<Either<Failure, bool>> addBuddy(String firstName, String lastName,
      String phoneNumber, String relationship);

  Future signOut();
}
