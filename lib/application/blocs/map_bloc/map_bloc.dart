import 'dart:async';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final UserLocation userLocation;
  final ApiInterface apiInterface;
  StreamSubscription<Location> _subscription;

  MapBloc({@required this.userLocation, @required this.apiInterface});
  @override
  MapState get initialState => MapInitial();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield* event.map(getLocationBroadcast: (e) async* {
      _subscription = apiInterface.getLocation("08011111111").listen((event) {
        print(event.longitude);
      });
      yield MapBroadcasting();
    }, stopSecondBroadcast: (e) async* {
      _subscription.pause();
      yield MapNotBroadcasting();
    }, resumeSecondBroadcast: (e) async* {
      _subscription.resume();
      yield MapBroadcasting();
    });
  }
}
