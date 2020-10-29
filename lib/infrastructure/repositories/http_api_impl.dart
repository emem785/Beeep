import 'dart:async';
import 'dart:convert';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const USER_KEY = 'user';
const TOKEN_KEY = 'token';

const API_LOCATION_UPDATE_DELAY = 6;
const API_LOCATION_REQUEST_DELAY = 6;

@LazySingleton(as: ApiInterface)
class HttpApiImpl implements ApiInterface {
  final LocalStorageInterface localStorageRepo;
  final NetworkInterface client;
  StreamSubscription<Location> _subscription;

  HttpApiImpl({
    @required this.localStorageRepo,
    @required this.client,
  });

  //Authentication
  @override
  Future<Either<Failure, bool>> registerUser(
      {User user, String password}) async {
    final body = {
      "firstname": user.firstname,
      "lastname": user.lastname,
      "email": user.email,
      "phone": user.phone,
      "twitter_handle": user.twitterHandle,
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
      final buddyMap = r["response"]["content"]["details"]["buddies"][0];
      await localStorageRepo.cacheUser(jsonEncode(userMap));
      await localStorageRepo.cacheToken(jsonEncode(tokenMap));
      await localStorageRepo.cacheBuddy(jsonEncode(buddyMap));
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
  Future<Either<Failure, Buddy>> addBuddy(Buddy buddy) async {
    final body = {
      "firstname": buddy.firstname,
      "lastname": buddy.lastname,
      "phone": buddy.phonenumber,
      "relationship": buddy.relationship
    };
    final response = await client.postAuth(endpoint: "add_buddy", body: body);
    return response.fold((l) => Left(l), (r) {
      final buddyMap = r["response"]["content"]["details"];
      return Right(Buddy.fromJson(buddyMap));
    });
  }

  //Interactions

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    final body = {
      "firstname": user.firstname,
      "lastname": user.lastname,
      "phone": user.phone,
      "email": user.email,
      "twitter_handle": user.twitterHandle
    };

    final response =
        await client.postAuth(endpoint: "update_details", body: body);
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
        await client.postAuth(endpoint: "update_details", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Future<Either<Failure, bool>> beep(String action, Location position) async {
    final body = {
      "longitude": position.longitude.toString(),
      "latitude": position.latitude.toString(),
      "action": action,
      "user_type": "civilian"
    };
    final response =
        await client.postAuth(endpoint: "start_or_stop_beeep", body: body);

    return response.fold((l) => Left(l), (r) {
      if (action == "start") {
        final message = r["response"]["content"]["details"]["message"];
        print(message);
        if (message == "New Beeep started") {
          return Right(true);
        } else {
          return Right(false);
        }
      } else {
        return Right(true);
      }
    });
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
        await client.postAuth(endpoint: "add_location", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  StreamSubscription<Location> sendLocationAsStream(
      Stream<Location> locationStream) {
    _subscription = locationStream.listen((event) {
      sendLocation(event.latitude, event.longitude);
      _subscription.pause(
          Future.delayed(const Duration(seconds: API_LOCATION_UPDATE_DELAY)));
    });
    return _subscription;
  }

  // @override
  // Stream<Location> getLocation(String phoneNumber) async* {
  //   while (true) {
  //     await Future.delayed(const Duration(seconds: API_LOCATION_REQUEST_DELAY));
  //     final response = await client.getAuth("get_user_location", phoneNumber);
  //     yield* response.fold((l) async* {
  //       yield Location(latitude: 0, longitude: 0);
  //     }, (r) async* {
  //       final location =
  //           r["response"]["content"]["details"]["target_user_location"];
  //       yield Location(latitude: location["lat"], longitude: location["lng"]);
  //     });
  //   }
  // }

  @override
  Future<Either<Failure, Location>> getLocation(String phoneNumber) async {
    final response = await client.getAuth("get_user_location", phoneNumber);
    return response.fold((l) => Left(l), (r) {
      final location =
          r["response"]["content"]["details"]["target_user_location"];
      return Right(
          Location(latitude: location["lat"], longitude: location["lng"]));
    });
  }

  @override
  Future<Either<Failure, List<Lawyer>>> getLawyers() async {
    final response = await client.getAuth("get_closest_lawyers");
    return response.fold((l) => Left(l), (r) {
      final lawyerMap = r["response"]["content"]["details"];
      List<Lawyer> lawyerList = List.from(lawyerMap)
          .map((m) => Lawyer.fromJson(m))
          .where((element) => element.onCall == true)
          .toList();
      return Right(lawyerList);
    });
  }

  @override
  Future<Either<Failure, bool>> updateFirebaseKey(
      FirebaseMessaging firebaseMessaging) async {
    final firebaseKey = await firebaseMessaging.getToken();
    print(firebaseKey);
    final body = {"firebase_key": firebaseKey};
    final response =
        await client.postAuth(endpoint: "update_details", body: body);

    return response.fold((l) => Left(l), (r) => Right(true));
  }

  @override
  Future<Either<Failure, List<Lawyer>>> getBuddyLawyers() async {
    final storageResponse = await localStorageRepo.getBuddy();
    final buddy =
        storageResponse.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
    final response =
        await client.getAuth("get_closest_lawyers_to_user", buddy.phonenumber);
    return response.fold((l) => Left(l), (r) {
      final lawyerMap = r["response"]["content"]["details"];
      List<Lawyer> lawyerList =
          List.from(lawyerMap).map((m) => Lawyer.fromJson(m)).toList();
      return Right(lawyerList);
    });
  }

  @override
  Future<Either<Failure, bool>> hireLawyer(String phoneNumber) async {
    final body = {"phone": phoneNumber};
    final response = await client.postAuth(endpoint: "ping_lawyer", body: body);
    return response.fold((l) => Left(l), (r) => Right(true));
  }
}
