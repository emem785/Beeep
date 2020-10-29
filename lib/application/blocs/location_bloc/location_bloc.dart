import 'dart:async';
import 'dart:convert';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/domain/Interface/websocket_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';
import '../../../infrastructure/models/map_tools.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final UserLocationInterface userLocation;
  final ApiInterface apiInterface;
  final MapInterface mapInterface;
  final WebSocketInterface webSocketInterface;
  final LocalStorageInterface localStorageInterface;
  StreamSubscription<Location> _apiUpdateSubscription;
  StreamSubscription<Location> _mapUpdateSubscription;
  MapTool mapTool;
  IOWebSocketChannel channel;

  LocationBloc({
    @required this.localStorageInterface,
    @required this.mapInterface,
    @required this.userLocation,
    @required this.apiInterface,
    @required this.webSocketInterface,
  }) : super(Initial());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.map(renderMap: (e) async* {
      await apiInterface.updateFirebaseKey(e.firebaseMessaging);
      final location = await userLocation.getLocation();
      mapTool = MapTool(location: location);
      yield MapRendered(mapTool);
    }, broadcastLocation: (e) async* {
      final isNotBeeping = await _startOrStopBeep("start");
      if (isNotBeeping) {
        channel = webSocketInterface.connect(await getUserPhoneNumber());
        _apiUpdateSubscription =
            webSocketInterface.sendLocationAsStreamWithSocket(channel);
        _apiUpdateSubscription.onError((error)=> print("connection errorr:$error"));
        _mapUpdateSubscription = mapInterface.startMapUpdateStream(mapTool);
        
        
        yield BroadcastStarted(mapTool);
      } else {
        await _startOrStopBeep("stop");
      }
      print("hello");
    }, stopBroadcast: (e) async* {
      await _startOrStopBeep("stop");
      _apiUpdateSubscription.cancel();
      final closed = webSocketInterface.closeSocketConnection(channel);
      _mapUpdateSubscription.cancel();
      yield BroadcastStopped(mapTool);

    }, resumeBroadcast: (e) async* {
      await _startOrStopBeep("start");
      _mapUpdateSubscription = mapInterface.startMapUpdateStream(mapTool);
      channel = webSocketInterface.connect(await getUserPhoneNumber());
      _apiUpdateSubscription =
          webSocketInterface.sendLocationAsStreamWithSocket(channel);
      yield BroadcastStarted(mapTool);
    });
  }

  Future<bool> _startOrStopBeep(String action) async {
    final location = await userLocation.getLocation();
    final response = await apiInterface.beep(action, location);
    return response.fold((l) => false, (r) => r);
  }

  Future<String> getUserPhoneNumber() async {
    final response = await localStorageInterface.getUser();
    final user =
        response.fold((l) => User(phone: "090k2332"), (r) => User.fromJson(jsonDecode(r)));
    return user.phone;
  }
}
