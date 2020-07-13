part of 'location_bloc.dart';

@immutable
@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.broadcasting(Stream<Location>locationStream,Location location) = Broadcasting;
  const factory LocationState.notBroadcasting(Location location) = NotBroadcasting;
}
