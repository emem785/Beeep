import 'dart:async';

import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:beep/infrastructure/models/location.dart';

abstract class MapInterface {
  StreamSubscription<Location> startMapUpdateStream(MapTool mapTool);
  StreamSubscription<Location> startMapUpdateStreamFromApi(
      MapTool mapTool, String phoneNumber);
  Marker getMarker(Location location);
}
