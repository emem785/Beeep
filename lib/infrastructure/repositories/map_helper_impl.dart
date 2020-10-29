import 'dart:async';
import 'dart:convert';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/domain/Interface/websocket_interface.dart';
import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong/latlong.dart';
import 'package:web_socket_channel/io.dart';

@Injectable(as: MapInterface)
class MapHelperImpl implements MapInterface {
  final UserLocationInterface userLocationInterface;
  final ApiInterface apiInterface;
  final WebSocketInterface webSocketInterface;

  MapHelperImpl({
    @required this.webSocketInterface,
    @required this.apiInterface,
    @required this.userLocationInterface,
  });
  @override
  StreamSubscription<Location> startMapUpdateStream(MapTool mapTool) {
    final mapUpdateSubscription =
        userLocationInterface.getUserLocationStream().listen((event) {
      mapTool.updateController(event);
      mapTool.markerStreamController.add(getMarker(event));
    });
    return mapUpdateSubscription;
  }

  @override
  StreamSubscription<dynamic> startMapUpdateStreamFromApi(
      MapTool mapTool, String phoneNumber, IOWebSocketChannel channel) {
    final mapUpdateSubscription = channel.stream.listen((event) {
      final map = jsonDecode(event);
      mapTool.updateController(
          Location(latitude: map["lat"], longitude: map["lng"]));
      mapTool.markerStreamController.add(
          getMarker(Location(latitude: map["lat"], longitude: map["lng"])));
    }, cancelOnError: false);
    return mapUpdateSubscription;
  }

  @override
  Marker getMarker(Location location) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(location.latitude, location.longitude),
      builder: (ctx) => new Container(
        child: Icon(Icons.location_on, color: Colors.red),
      ),
    );
  }

  @override
  Future<MapTool> getMapToolWithAddressFromApi(
      MapTool mapTool, String phoneNumber) async {
    // final location = await apiInterface.getLocation(phoneNumber).first;
    // final address = await userLocationInterface.getBuddyAddressFromLocation(location);
    mapTool.setAddress("dddd");
    return mapTool;
  }
}
