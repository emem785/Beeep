import 'dart:async';

import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserLocation)
class UserLocationImpl implements UserLocation {
  final Geolocator geolocator;
  StreamController<Location> _controller = StreamController<Location>();

  UserLocationImpl({@required this.geolocator});

  @override
  void startLocationStream() {
    geolocator.getPositionStream().listen((event) {
      _controller
          .add(Location(latitude: event.latitude, longitude: event.longitude));
    });
  }

  @override
  StreamController<Location> getController() {
    return _controller;
  }

  @override
  Future<Location> getLocation() async {
    final position = await geolocator.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
