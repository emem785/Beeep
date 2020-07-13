import 'package:beep/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';



abstract class LocalStorageInterface{
  Future cacheUser(String data);
  Future<Either<Failure,String>> getUser();
  Future removeUser();
  Future cacheToken(String data);
  Future<Either<Failure,String>> getToken();
  Future removeToken();
  Future cacheBuddy(String data);
  Future<Either<Failure,String>> getBuddy();
  Future removeBuddy();
}