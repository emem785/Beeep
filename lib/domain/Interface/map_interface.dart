import 'dart:async';

import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:web_socket_channel/io.dart';

abstract class MapInterface {
  StreamSubscription<Location> startMapUpdateStream(MapTool mapTool);
  StreamSubscription<dynamic> startMapUpdateStreamFromApi(
      MapTool mapTool, String phoneNumber,IOWebSocketChannel channel);
  Marker getMarker(Location location);
}
