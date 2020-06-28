import 'dart:async';

import 'package:beep/infrastructure/models/location.dart';

abstract class UserLocation {
  void startLocationStream();
  StreamController<Location> getController();
  Future<Location> getLocation();
}
