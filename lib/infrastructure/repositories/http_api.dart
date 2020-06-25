import 'dart:convert';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'local_storage_repo.dart';
import 'network_client.dart';

const USER_KEY = 'user';
const TOKEN_KEY = 'token';

class HttpApiRepository implements ApiInterface {
  final LocalStorageRepo localStorageRepo;
  final NetworkClient client;

  HttpApiRepository({@required this.localStorageRepo, @required this.client});

  @override
  Future<Either<Failure, String>> getVerifyCode(String phoneNumber) async {
    final response = await client.get("get_verification_code", phoneNumber);
    return response.fold(
        (l) => Left(l),
        (r) => Right(
            r["response"]["content"]["verification_code"]["code"].toString()));
  }

  @override
  Future signOut() async {
    // await localStorageRepo.removeData(USER_KEY);
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
  Future<Either<Failure, bool>> addBuddy(String firstName, String lastName,
      String phoneNumber, String relationship) async {
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phoneNumber,
      "relationship": relationship
    };
    final response =
        await client.postToken(endpoint: "add_buddy", body: body);
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
  Future<Either<Failure, bool>> updateUser(String firstName, String lastName,
      String email, String phoneNumber, String twitterHandle) async {
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phoneNumber,
      "email": email,
      "twitter_handle": twitterHandle
    };

    final response = await client.postToken(endpoint: "update_details", body: body);
    return response.fold((l) => Left(l), (r) async {
      final userMap = r["response"]["content"]["details"];
      final tokenMap = r["response"]["auth_keys"]["access_token"];
      await localStorageRepo.cacheUser(jsonEncode(userMap));
      await localStorageRepo.cacheToken(jsonEncode(tokenMap));
      return Right(true);
    });
  }
}
