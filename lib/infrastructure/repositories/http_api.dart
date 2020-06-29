import 'dart:convert';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const USER_KEY = 'user';
const TOKEN_KEY = 'token';

@LazySingleton(as: ApiInterface)
class HttpApiRepository implements ApiInterface {
  final LocalStorageInterface localStorageRepo;
  final NetworkInterface client;

  HttpApiRepository({@required this.localStorageRepo, @required this.client});

  //Authentication
  @override
  Future<Either<Failure, bool>> registerUser(String firstName, String lastName,
      String email, String phoneNumber, String password) async {
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "phone": phoneNumber,
      "password": password
    };
    final response =
        await client.post(endPoint: "mobile_register_civilian", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Future<Either<Failure, User>> signIn(
      String phoneNumber, String password) async {
    final body = {"phone": phoneNumber, "password": password};
    final response = await client.post(endPoint: "mobile_signin", body: body);
    return response.fold((l) => Left(l), (r) async {
      final userMap = r["response"]["content"]["details"];
      final tokenMap = r["response"]["auth_keys"]["access_token"];
      await localStorageRepo.cacheUser(jsonEncode(userMap));
      await localStorageRepo.cacheToken(jsonEncode(tokenMap));
      final user = User.fromJson(userMap);
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, String>> getVerifyCode(String phoneNumber) async {
    final response = await client.get("get_verification_code", phoneNumber);
    return response.fold(
        (l) => Left(l),
        (r) => Right(
            r["response"]["content"]["verification_code"]["code"].toString()));
  }

  @override
  Future<Either<Failure, User>> mobileVerify(
      String phoneNumber, String vcode) async {
    final body = {"phone": phoneNumber, "code": vcode};
    final response =
        await client.post(endPoint: "mobile_verify_code", body: body);
    return response.fold((l) => Left(l), (r) async {
      final userMap = r["response"]["content"]["details"];
      final tokenMap = r["response"]["auth_keys"]["access_token"];
      await localStorageRepo.cacheUser(jsonEncode(userMap));
      await localStorageRepo.cacheToken(jsonEncode(tokenMap));
      final user = User.fromJson(userMap);
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, bool>> addBuddy(String firstName, String lastName,
      String phoneNumber, String relationship) async {
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phoneNumber,
      "relationship": relationship
    };
    final response = await client.postToken(endpoint: "add_buddy", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  //Interactions

  @override
  Future<Either<Failure, User>> updateUser(String firstName, String lastName,
      String email, String phoneNumber, String twitterHandle) async {
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phoneNumber,
      "email": email,
      "twitter_handle": twitterHandle
    };

    final response =
        await client.postToken(endpoint: "update_details", body: body);
    return response.fold((l) => Left(l), (r) async {
      final userMap = r["response"]["content"]["details"];
      final user = User.fromJson(userMap);
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, bool>> updatePassword(String password) async {
    final body = {"password": password};
    final response =
        await client.postToken(endpoint: "update_details", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Future<Either<Failure, bool>> beep(
      String action, double latitude, double longitude) async {
    final body = {
      "longitude": longitude.toString(),
      "latitude": latitude.toString(),
      "action": action,
      "user_type": "civilian"
    };
    final response =
        await client.postToken(endpoint: "start_or_stop_beeep", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Future<Either<Failure, bool>> sendLocation(
      double latitude, double longitude) async {
    final body = {
      "longitude": longitude.toString(),
      "latitude": latitude.toString(),
      "user_type": "civilian"
    };
    final response =
        await client.postToken(endpoint: "add_location", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Stream<Location> getLocation(String phoneNumber) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      final response = await client.getToken("get_user_location", phoneNumber);
      yield* response.fold((l) async* {
        yield Location(latitude: 0, longitude: 0);
      }, (r) async* {
        final location =
            r["response"]["content"]["details"]["target_user_location"];

        yield Location(latitude: location["lat"], longitude: location["lng"]);
      });
    }
  }

  @override
  Future<Either<Failure, List<Lawyer>>> getLawyers() async {
    final response = await client.getToken("get_closest_lawyers");
    return response.fold((l) => Left(l), (r) {
      List<Lawyer> lawyerList = [];
      final lawyerMap = r["response"]["content"]["details"]["0"];
      lawyerList.add(Lawyer.fromJson(lawyerMap));

      // print(lawyerList.toString());
      return Right(lawyerList);
    });
  }
}
