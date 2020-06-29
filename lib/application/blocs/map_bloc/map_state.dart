part of 'map_bloc.dart';

@immutable
@freezed
abstract class MapState with _$MapState{
  const factory MapState.initial() = MapInitial;
  const factory MapState.broadcasting() = MapBroadcasting;
  const factory MapState.notBroadcasting() = MapNotBroadcasting;
  const factory MapState.broadcastError() = BroadcastError;
}