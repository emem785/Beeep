import 'dart:async';

import 'package:beep/core/error/failure.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocationInterface {
  Stream<Location> getUserLocationStream();
  Future<Location> getLocation();
  Future<Either<Failure,String>> getAddressFromLocation();
  Future<Either<Failure,String>> getBuddyAddressFromLocation(Location location);
}
