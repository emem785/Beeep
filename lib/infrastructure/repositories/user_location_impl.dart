import 'dart:async';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserLocationInterface)
class UserLocationImpl implements UserLocationInterface {
  final Geolocator geolocator;

  UserLocationImpl({@required this.geolocator});

  @override
  Future<Location> getLocation() async {
    final position = await geolocator.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }

  @override
  Stream<Location> getUserLocationStream() {
    return geolocator
        .getPositionStream()
        .map((event) =>
            Location(latitude: event.latitude, longitude: event.longitude))
        .asBroadcastStream();
  }

  @override
  Future<Either<Failure, String>> getAddressFromLocation() async {
    try {
      final location = await getLocation();
      final addresses = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(location.latitude, location.longitude));
      final address = addresses.first;
      return Right(address.addressLine);
    } catch (e) {
      return Left(ServerFailure("Location not gotten"));
    }
  }

  @override
  Future<Either<Failure, String>> getBuddyAddressFromLocation(
      Location location) async {
    try {
      final addresses = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(location.latitude, location.longitude));
      final address = addresses.first;
      return Right(address.addressLine);
    } catch (e) {
      return Left(ServerFailure("Location not gotten"));
    }
  }
}
