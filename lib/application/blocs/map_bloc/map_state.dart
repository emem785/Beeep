part of 'map_bloc.dart';

@immutable
@freezed
abstract class MapState with _$MapState{
  const factory MapState.initial() = MapInitial;
  const factory MapState.broadcasting(Buddy buddy,Stream<Location> stream,Location location) = MapBroadcasting;
  const factory MapState.notBroadcasting(Location location) = MapNotBroadcasting;
  const factory MapState.broadcastError() = BroadcastError;
  const factory MapState.loading() = MapLoading;
}