import 'package:beep/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


abstract class NetworkInterface {
  Future<Either<Failure, Map<String, dynamic>>> post({endPoint, body});
  Future<Either<Failure, Map<String, dynamic>>> get(endPoint, [data]);
  Future<Either<Failure, Map<String, dynamic>>> postToken({endpoint,body});
}
