import 'dart:async';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../infrastructure/models/map_tools.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final UserLocationInterface userLocation;
  final ApiInterface apiInterface;
  final MapInterface mapInterface;
  StreamSubscription<Location> _apiUpdateSubscription;
  StreamSubscription<Location> _mapUpdateSubscription;
  MapTool mapTool;

  LocationBloc(
      {@required this.mapInterface,
      @required this.userLocation,
      @required this.apiInterface})
      : super(Initial());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.map(renderMap: (e) async* {
      await apiInterface.updateFirebaseKey(e.firebaseMessaging);
      final location = await userLocation.getLocation();
      await apiInterface.sendLocation(location.latitude, location.longitude);
      mapTool = MapTool(location: location);
      yield MapRendered(mapTool);
    }, broadcastLocation: (e) async* {
      final isNotBeeping = await _startOrStopBeep("start");
      if (isNotBeeping) {
        _apiUpdateSubscription = apiInterface
            .sendLocationAsStream(userLocation.getUserLocationStream());
        _mapUpdateSubscription = mapInterface.startMapUpdateStream(mapTool);
        yield BroadcastStarted(mapTool);
      }else{
        await _startOrStopBeep("stop");
      }
    }, stopBroadcast: (e) async* {
      await _startOrStopBeep("stop");
      _apiUpdateSubscription.cancel();
      _mapUpdateSubscription.cancel();
      yield BroadcastStopped(mapTool);
    }, resumeBroadcast: (e) async* {
      await _startOrStopBeep("start");
      _mapUpdateSubscription = mapInterface.startMapUpdateStream(mapTool);
      _apiUpdateSubscription = apiInterface
          .sendLocationAsStream(userLocation.getUserLocationStream());
      yield BroadcastStarted(mapTool);
    });
  }

  Future<bool> _startOrStopBeep(String action) async {
    final location = await userLocation.getLocation();
    final response = await apiInterface.beep(action, location);
    return response.fold((l) => null, (r) => r);
  }
}
