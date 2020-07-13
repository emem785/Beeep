import 'dart:async';
import 'dart:core';
import 'package:beep/core/error/failure.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';

abstract class ApiInterface {
  //Authentication
  Future<Either<Failure, bool>> registerUser(String firstName, String lastName,
      String email, String phoneNumber, String password);

  Future<Either<Failure, User>> signIn(String phoneNumber, String password);
  Future<Either<Failure, String>> getVerifyCode(String phoneNumber);

  Future<Either<Failure, User>> mobileVerify(String phoneNumber, String code);
  Future<Either<Failure, Buddy>> addBuddy(String firstName, String lastName,
      String phoneNumber, String relationship);
  //Modify user details 
  Future<Either<Failure, User>> updateUser(String firstName, String lastName,
      String email, String phoneNumber, String twitterHandle);
  Future<Either<Failure, bool>> updatePassword(String password);
  //Location
  Future<Either<Failure, bool>> beep(
      String action, double latitude, double longitude);
  Future<Either<Failure, bool>> sendLocation(double latitude, double longitude);
   Stream<Location> getLocation(String phoneNumber);
  Future<Either<Failure, List<Lawyer>>> getLawyers();
}
