import 'dart:async';
import 'dart:core';
import 'package:beep/core/error/failure.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class ApiInterface {
  //Authentication
  Future<Either<Failure, bool>> registerUser({User user, String password});

  Future<Either<Failure, User>> signIn(String phoneNumber, String password);
  Future<Either<Failure, String>> getVerifyCode(String phoneNumber);

  Future<Either<Failure, User>> mobileVerify(String phoneNumber, String code);
  Future<Either<Failure, Buddy>> addBuddy(Buddy buddy);
  //Modify user details
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, bool>> updatePassword(String password);
  Future<Either<Failure, bool>> updateFirebaseKey(FirebaseMessaging firebaseMessaging);
  //Location
  Future<Either<Failure, bool>> beep(String action, Location position);
  Future<Either<Failure, bool>> sendLocation(double latitude, double longitude);
  StreamSubscription<Location> sendLocationAsStream(Stream<Location> locationStream);
  Stream<Location> getLocation(String phoneNumber);
 
  Future<Either<Failure, List<Lawyer>>> getLawyers();
  Future<Either<Failure, bool>> hireLawyer(String phoneNumber);
  Future<Either<Failure, List<Lawyer>>> getBuddyLawyers();
}
