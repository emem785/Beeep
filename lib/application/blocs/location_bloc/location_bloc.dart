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
  final UserLocationInterface userLocation;
  final ApiInterface apiInterface;
  StreamSubscription<Location> _subscription;
  Stream<Location> _stream;

  LocationBloc({@required this.userLocation, @required this.apiInterface}) : super(Initial());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.map(broadcastLocation: (e) async* {
      final location = await userLocation.getLocation();
      apiInterface.beep("start", location);
      final _stream = userLocation.getStream();
      _subscription = _stream.listen((event) {
        apiInterface.sendLocation(event.latitude, event.longitude);
        _subscription.pause(Future.delayed(Duration(seconds: 5)));
      });
      yield Broadcasting(_stream, location);
    }, stopBroadcast: (e) async* {
      _subscription.cancel();
      final location = await userLocation.getLocation();
      apiInterface.beep("stop",location);
      yield NotBroadcasting(location);
    }, resume: (e) async* {
      final location = await userLocation.getLocation();
      final _stream = userLocation.getStream();
      _subscription = _stream.listen((event) {
        apiInterface.sendLocation(event.latitude, event.longitude);
        _subscription.pause(Future.delayed(Duration(seconds: 5)));
      });
      yield Broadcasting(_stream, location);
    });
  }
}
