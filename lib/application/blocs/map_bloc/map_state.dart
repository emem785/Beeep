part of 'map_bloc.dart';

@immutable
@freezed
abstract class MapState with _$MapState{
  const factory MapState.initial() = MapInitial;
  const factory MapState.receivingBroadcast(Buddy buddy,Stream<Location> stream,Location location) = ReceivingBroadcast;
  const factory MapState.broadcastEnded() = BroadcastEnded;
  const factory MapState.broadcastError() = BroadcastError;
  const factory MapState.loading() = MapLoading;
}