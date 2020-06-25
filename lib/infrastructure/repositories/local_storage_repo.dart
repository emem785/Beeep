import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/storage.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USER_KEY = 'user';
const TOKEN_KEY = 'token';

class LocalStorageRepo implements LocalStorageInterface {
  @override
  Future cacheUser(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_KEY, data);
  }

  @override
  Future<Either<Failure, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(USER_KEY);
    if (data == null) {
      return Left(GetCacheFailure("user not available"));
    } else {
      return right(data);
    }
  }

  @override
  Future removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(USER_KEY);
  }

  @override
  Future cacheToken(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, data);
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(TOKEN_KEY);
    if (data == null) {
      return Left(GetCacheFailure("token not available"));
    } else {
      return right(data);
    }
  }

  @override
  Future removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(TOKEN_KEY);
  }
}
