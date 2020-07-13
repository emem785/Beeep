import 'dart:async';

import 'package:beep/infrastructure/models/location.dart';

abstract class UserLocationInterface {
  Stream<Location> getStream();
  Future<Location> getLocation();
}
