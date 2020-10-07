part of 'location_bloc.dart';

@immutable
@freezed
abstract class LocationEvent with _$LocationEvent {
  const factory LocationEvent.renderMap(FirebaseMessaging firebaseMessaging) = RenderMap;
  const factory LocationEvent.broadcastLocation() = BroadcastLocation;
  const factory LocationEvent.stopBroadcast() = StopBroadcast;
  const factory LocationEvent.resumeBroadcast() = ResumeBroadcast;
}
