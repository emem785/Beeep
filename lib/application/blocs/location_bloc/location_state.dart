part of 'location_bloc.dart';


@immutable
@freezed
abstract class LocationState with _$LocationState{
  const factory LocationState.initial() = Initial;
  const factory LocationState.broadcasting() = Broadcasting;
  const factory LocationState.notBroadcasting() = NotBroadcasting;
}
