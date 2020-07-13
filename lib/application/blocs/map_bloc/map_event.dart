part of 'map_bloc.dart';

@immutable
@freezed
abstract class MapEvent with _$MapEvent{
  const factory MapEvent.getLocationBroadcast(String phoneNumber) = GetLocationBroadcast;
  const factory MapEvent.stopSecondBroadcast() = StopSecondBroadcast;
  const factory MapEvent.resumeSecondBroadcast() = ResumeSecondBroadcast;
}