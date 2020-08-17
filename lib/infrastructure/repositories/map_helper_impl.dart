import 'dart:async';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong/latlong.dart';

@Injectable(as: MapInterface)
class MapHelperImpl implements MapInterface {
  final UserLocationInterface userLocationInterface;
  final ApiInterface apiInterface;

  MapHelperImpl(
      {@required this.apiInterface, @required this.userLocationInterface});
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
  StreamSubscription<Location> startMapUpdateStreamFromApi(
      MapTool mapTool, String phoneNumber) {
    final mapUpdateSubscription =
        apiInterface.getLocation(phoneNumber).listen((event) {
      mapTool.updateController(event);
      mapTool.markerStreamController.add(getMarker(event));
      print(event.longitude);
    });
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
