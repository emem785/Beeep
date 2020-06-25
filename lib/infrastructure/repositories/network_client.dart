import 'dart:convert';
import 'dart:io';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/domain/Interface/storage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const URL = 'http://beeep.pythonanywhere.com/auth/';
const URL_SHORT = 'http://beeep.pythonanywhere.com/';

class NetworkClient implements NetworkInterface {
  final LocalStorageInterface localStorageInterface;

  NetworkClient({@required this.localStorageInterface});

  @override
  Future<Either<Failure, Map<String, dynamic>>> postToken(
      {endpoint, body}) async {
    final url = URL_SHORT + endpoint;
    final token = await localStorageInterface.getToken().then((value) {
      return value.fold((l) => -1, (r) => jsonDecode(r));
    });
    final userMap = await localStorageInterface.getUser().then((value) {
      return value.fold((l) => -1, (r) => jsonDecode(r));
    });
    final phone = userMap["phone"].toString();
  
    //TODO:return to normal

    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          token,
      "phone": phone
    };
    print(headers);
   
    final jsonResponse =
        await http.post(url, body: jsonEncode(body), headers: headers);
    print(jsonResponse.body);
    if (jsonResponse.statusCode == 201) {
      final response = jsonDecode(jsonResponse.body);
      return Right(response);
    } else if (jsonResponse.statusCode == 202) {
      final response = jsonDecode(jsonResponse.body);
      return Right(response);
    } else if (jsonResponse.statusCode == 401) {
      return Left(ServerFailure("Username or Password might be wrong..!!"));
    } else if (jsonResponse.statusCode == 412) {
      return Left(ServerFailure("Phone number already exists"));
    } else {
      return Left(ServerFailure("Server Error"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(endPoint, [data]) async {
    final url = URL + endPoint + "/" + data ?? "";
    final jsonResponse = await http.get(url);
    if (jsonResponse.statusCode == 200) {
      final response = jsonDecode(jsonResponse.body);
      return Right(response);
    } else {
      return Left(ServerFailure("Server Error"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> post({endPoint, body}) async {
    final url = URL + endPoint;
    final jsonResponse = await http.post(url, body: jsonEncode(body));
    if (jsonResponse.statusCode == 201) {
      final response = jsonDecode(jsonResponse.body);
      return Right(response);
    } else if (jsonResponse.statusCode == 202) {
      final response = jsonDecode(jsonResponse.body);
      return Right(response);
    } else if (jsonResponse.statusCode == 401) {
      return Left(ServerFailure("Username or Password might be wrong..!!"));
    } else if (jsonResponse.statusCode == 412) {
      return Left(ServerFailure("Phone number already exists"));
    } else {
      return Left(ServerFailure("Server Error"));
    }
  }
}
