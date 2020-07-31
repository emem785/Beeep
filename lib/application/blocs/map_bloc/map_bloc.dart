import 'dart:async';
import 'dart:convert';

import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../infrastructure/models/map_tools.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final MapInterface mapInterface;
  final ApiInterface apiInterface;
  final UserLocationInterface userLocationInterface;
  final LocalStorageInterface localStorageInterface;
  StreamSubscription<Location> _mapUpdateSubscription;
  MapTool mapTool;

  MapBloc({
    @required this.userLocationInterface,
    @required this.mapInterface,
    @required this.apiInterface,
    @required this.localStorageInterface,
  }) : super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield MapLoading();
    yield* event.map(
      renderBuddyMap: (e) async* {
        final buddy = await _getBuddy();
        final buddyLocation = await _getBuddyLocation(buddy);
        final mapTool = MapTool(location: buddyLocation);
        yield MapRendered(mapTool);
        add(StartBroadcast(mapTool, buddy));
      },
      startBroadcast: (e) async* {
        _mapUpdateSubscription = mapInterface.startMapUpdateStreamFromApi(
            e.mapTool, e.buddy.phonenumber);
        yield BroadcastStarted(e.buddy, e.mapTool);
      },
      stopSecondBroadcast: (e) async* {
        _mapUpdateSubscription.cancel();
        yield BroadcastEnded();
      },
    );
  }

  Future<Location> _getBuddyLocation(Buddy buddy) async {
    final location = await apiInterface.getLocation(buddy.phonenumber).first;
    return location;
  }

  Future<Buddy> _getBuddy() async {
    final response = await localStorageInterface.getBuddy();
    final buddy =
        response.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
    return buddy;
  }
}
