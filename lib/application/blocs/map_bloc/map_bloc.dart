import 'dart:async';
import 'dart:convert';

import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/domain/Interface/map_interface.dart';
import 'package:beep/domain/Interface/websocket_interface.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';
import '../../../infrastructure/models/map_tools.dart';
import '../../../infrastructure/models/lawyers.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final MapInterface mapInterface;
  final ApiInterface apiInterface;
  final UserLocationInterface userLocationInterface;
  final LocalStorageInterface localStorageInterface;
  final WebSocketInterface webSocketInterface;
  StreamSubscription<dynamic> _mapUpdateSubscription;
  MapTool mapTool;
  IOWebSocketChannel channel;
  Buddy buddy;

  MapBloc({
    @required this.webSocketInterface,
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
    yield* event.map(renderBuddyMap: (e) async* {
      buddy = await _getBuddy();
      final buddyLocation = await _getBuddyLocation(buddy);
      final mapTool = MapTool(location: buddyLocation);
      yield MapRendered(mapTool);
      add(StartBroadcast(mapTool, buddy));
    }, startBroadcast: (e) async* {
      print("broadcast started");
      channel = webSocketInterface.connect(buddy.phonenumber);

      _mapUpdateSubscription = mapInterface.startMapUpdateStreamFromApi(
          e.mapTool, e.buddy.phonenumber, channel);

      _mapUpdateSubscription.onError((error) =>
          this.add(OnBroadcastError(ServerFailure("Connection Error"))));
  
      _mapUpdateSubscription.onDone(() => this.add(StopSecondBroadcast()));

      yield BroadcastStarted(e.buddy, e.mapTool);
    }, stopSecondBroadcast: (e) async* {
      _mapUpdateSubscription.cancel();
      buddy = await _getBuddy();
      yield BroadcastEnded(await _getBuddyLocation(buddy));
    }, onBroadcastError: (e) async* {
      buddy = await _getBuddy();
      yield BroadcastError(await _getBuddyLocation(buddy));
    });
  }

  Future<Location> _getBuddyLocation(Buddy buddy) async {
    final response = await apiInterface.getLocation(buddy.phonenumber);
    return response.fold((l) => Location(latitude: 0, longitude: 0), (r) => r);
  }

  Future<Buddy> _getBuddy() async {
    final response = await localStorageInterface.getBuddy();
    final buddy =
        response.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
    return buddy;
  }
}
