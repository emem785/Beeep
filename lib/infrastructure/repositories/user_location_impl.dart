import 'dart:async';

import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserLocationInterface)
class UserLocationImpl implements UserLocationInterface {
  final Geolocator geolocator;

  UserLocationImpl({@required this.geolocator});

  @override
  Stream<Location> getStream() {
    return geolocator.getPositionStream().map((event) =>
        Location(latitude: event.latitude, longitude: event.longitude)).asBroadcastStream();
  }

  @override
  Future<Location> getLocation() async {
    final position = await geolocator.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
