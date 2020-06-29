import 'dart:async';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final UserLocation userLocation;
  final ApiInterface apiInterface;
  StreamController<Location> _controller;
  StreamSubscription<Location> _subscription;

  LocationBloc({@required this.userLocation, @required this.apiInterface});
  @override
  LocationState get initialState => Initial();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.map(broadcastLocation: (e) async* {
      userLocation.startLocationStream();
      _controller = userLocation.getController();
      final location = await userLocation.getLocation();
      apiInterface.beep("start", location.latitude, location.longitude);
      _subscription = _controller.stream.listen((event) {
        apiInterface.sendLocation(event.latitude, event.longitude);
        print(event.longitude);
        _subscription.pause(Future.delayed(Duration(seconds: 5)));
      });
      yield Broadcasting();
    }, stopBroadcast: (e) async* {
      _subscription.pause();
      final location = await userLocation.getLocation();
      apiInterface.beep("stop", location.latitude, location.longitude);
      yield NotBroadcasting();
    }, resume: (e) async* {
      final location = await userLocation.getLocation();
      apiInterface.beep("start", location.latitude, location.longitude);
      _subscription.resume();
      yield Broadcasting();
    });
  }
}
