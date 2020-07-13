// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MapEventTearOff {
  const _$MapEventTearOff();

  GetLocationBroadcast getLocationBroadcast(String phoneNumber) {
    return GetLocationBroadcast(
      phoneNumber,
    );
  }

  StopSecondBroadcast stopSecondBroadcast() {
    return const StopSecondBroadcast();
  }

  ResumeSecondBroadcast resumeSecondBroadcast() {
    return const ResumeSecondBroadcast();
  }
}

// ignore: unused_element
const $MapEvent = _$MapEventTearOff();

mixin _$MapEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLocationBroadcast(String phoneNumber),
    @required Result stopSecondBroadcast(),
    @required Result resumeSecondBroadcast(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLocationBroadcast(String phoneNumber),
    Result stopSecondBroadcast(),
    Result resumeSecondBroadcast(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLocationBroadcast(GetLocationBroadcast value),
    @required Result stopSecondBroadcast(StopSecondBroadcast value),
    @required Result resumeSecondBroadcast(ResumeSecondBroadcast value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLocationBroadcast(GetLocationBroadcast value),
    Result stopSecondBroadcast(StopSecondBroadcast value),
    Result resumeSecondBroadcast(ResumeSecondBroadcast value),
    @required Result orElse(),
  });
}

abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res>;
}

class _$MapEventCopyWithImpl<$Res> implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  final MapEvent _value;
  // ignore: unused_field
  final $Res Function(MapEvent) _then;
}

abstract class $GetLocationBroadcastCopyWith<$Res> {
  factory $GetLocationBroadcastCopyWith(GetLocationBroadcast value,
          $Res Function(GetLocationBroadcast) then) =
      _$GetLocationBroadcastCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

class _$GetLocationBroadcastCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements $GetLocationBroadcastCopyWith<$Res> {
  _$GetLocationBroadcastCopyWithImpl(
      GetLocationBroadcast _value, $Res Function(GetLocationBroadcast) _then)
      : super(_value, (v) => _then(v as GetLocationBroadcast));

  @override
  GetLocationBroadcast get _value => super._value as GetLocationBroadcast;

  @override
  $Res call({
    Object phoneNumber = freezed,
  }) {
    return _then(GetLocationBroadcast(
      phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
    ));
  }
}

class _$GetLocationBroadcast implements GetLocationBroadcast {
  const _$GetLocationBroadcast(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'MapEvent.getLocationBroadcast(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetLocationBroadcast &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  $GetLocationBroadcastCopyWith<GetLocationBroadcast> get copyWith =>
      _$GetLocationBroadcastCopyWithImpl<GetLocationBroadcast>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLocationBroadcast(String phoneNumber),
    @required Result stopSecondBroadcast(),
    @required Result resumeSecondBroadcast(),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return getLocationBroadcast(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLocationBroadcast(String phoneNumber),
    Result stopSecondBroadcast(),
    Result resumeSecondBroadcast(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationBroadcast != null) {
      return getLocationBroadcast(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLocationBroadcast(GetLocationBroadcast value),
    @required Result stopSecondBroadcast(StopSecondBroadcast value),
    @required Result resumeSecondBroadcast(ResumeSecondBroadcast value),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return getLocationBroadcast(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLocationBroadcast(GetLocationBroadcast value),
    Result stopSecondBroadcast(StopSecondBroadcast value),
    Result resumeSecondBroadcast(ResumeSecondBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationBroadcast != null) {
      return getLocationBroadcast(this);
    }
    return orElse();
  }
}

abstract class GetLocationBroadcast implements MapEvent {
  const factory GetLocationBroadcast(String phoneNumber) =
      _$GetLocationBroadcast;

  String get phoneNumber;
  $GetLocationBroadcastCopyWith<GetLocationBroadcast> get copyWith;
}

abstract class $StopSecondBroadcastCopyWith<$Res> {
  factory $StopSecondBroadcastCopyWith(
          StopSecondBroadcast value, $Res Function(StopSecondBroadcast) then) =
      _$StopSecondBroadcastCopyWithImpl<$Res>;
}

class _$StopSecondBroadcastCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements $StopSecondBroadcastCopyWith<$Res> {
  _$StopSecondBroadcastCopyWithImpl(
      StopSecondBroadcast _value, $Res Function(StopSecondBroadcast) _then)
      : super(_value, (v) => _then(v as StopSecondBroadcast));

  @override
  StopSecondBroadcast get _value => super._value as StopSecondBroadcast;
}

class _$StopSecondBroadcast implements StopSecondBroadcast {
  const _$StopSecondBroadcast();

  @override
  String toString() {
    return 'MapEvent.stopSecondBroadcast()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StopSecondBroadcast);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLocationBroadcast(String phoneNumber),
    @required Result stopSecondBroadcast(),
    @required Result resumeSecondBroadcast(),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return stopSecondBroadcast();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLocationBroadcast(String phoneNumber),
    Result stopSecondBroadcast(),
    Result resumeSecondBroadcast(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stopSecondBroadcast != null) {
      return stopSecondBroadcast();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLocationBroadcast(GetLocationBroadcast value),
    @required Result stopSecondBroadcast(StopSecondBroadcast value),
    @required Result resumeSecondBroadcast(ResumeSecondBroadcast value),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return stopSecondBroadcast(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLocationBroadcast(GetLocationBroadcast value),
    Result stopSecondBroadcast(StopSecondBroadcast value),
    Result resumeSecondBroadcast(ResumeSecondBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stopSecondBroadcast != null) {
      return stopSecondBroadcast(this);
    }
    return orElse();
  }
}

abstract class StopSecondBroadcast implements MapEvent {
  const factory StopSecondBroadcast() = _$StopSecondBroadcast;
}

abstract class $ResumeSecondBroadcastCopyWith<$Res> {
  factory $ResumeSecondBroadcastCopyWith(ResumeSecondBroadcast value,
          $Res Function(ResumeSecondBroadcast) then) =
      _$ResumeSecondBroadcastCopyWithImpl<$Res>;
}

class _$ResumeSecondBroadcastCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements $ResumeSecondBroadcastCopyWith<$Res> {
  _$ResumeSecondBroadcastCopyWithImpl(
      ResumeSecondBroadcast _value, $Res Function(ResumeSecondBroadcast) _then)
      : super(_value, (v) => _then(v as ResumeSecondBroadcast));

  @override
  ResumeSecondBroadcast get _value => super._value as ResumeSecondBroadcast;
}

class _$ResumeSecondBroadcast implements ResumeSecondBroadcast {
  const _$ResumeSecondBroadcast();

  @override
  String toString() {
    return 'MapEvent.resumeSecondBroadcast()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResumeSecondBroadcast);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLocationBroadcast(String phoneNumber),
    @required Result stopSecondBroadcast(),
    @required Result resumeSecondBroadcast(),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return resumeSecondBroadcast();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLocationBroadcast(String phoneNumber),
    Result stopSecondBroadcast(),
    Result resumeSecondBroadcast(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resumeSecondBroadcast != null) {
      return resumeSecondBroadcast();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLocationBroadcast(GetLocationBroadcast value),
    @required Result stopSecondBroadcast(StopSecondBroadcast value),
    @required Result resumeSecondBroadcast(ResumeSecondBroadcast value),
  }) {
    assert(getLocationBroadcast != null);
    assert(stopSecondBroadcast != null);
    assert(resumeSecondBroadcast != null);
    return resumeSecondBroadcast(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLocationBroadcast(GetLocationBroadcast value),
    Result stopSecondBroadcast(StopSecondBroadcast value),
    Result resumeSecondBroadcast(ResumeSecondBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resumeSecondBroadcast != null) {
      return resumeSecondBroadcast(this);
    }
    return orElse();
  }
}

abstract class ResumeSecondBroadcast implements MapEvent {
  const factory ResumeSecondBroadcast() = _$ResumeSecondBroadcast;
}

class _$MapStateTearOff {
  const _$MapStateTearOff();

  MapInitial initial() {
    return const MapInitial();
  }

  MapBroadcasting broadcasting(
      Buddy buddy, Stream<Location> stream, Location location) {
    return MapBroadcasting(
      buddy,
      stream,
      location,
    );
  }

  MapNotBroadcasting notBroadcasting(Location location) {
    return MapNotBroadcasting(
      location,
    );
  }

  BroadcastError broadcastError() {
    return const BroadcastError();
  }

  MapLoading loading() {
    return const MapLoading();
  }
}

// ignore: unused_element
const $MapState = _$MapStateTearOff();

mixin _$MapState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  });
}

abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res>;
}

class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  final MapState _value;
  // ignore: unused_field
  final $Res Function(MapState) _then;
}

abstract class $MapInitialCopyWith<$Res> {
  factory $MapInitialCopyWith(
          MapInitial value, $Res Function(MapInitial) then) =
      _$MapInitialCopyWithImpl<$Res>;
}

class _$MapInitialCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements $MapInitialCopyWith<$Res> {
  _$MapInitialCopyWithImpl(MapInitial _value, $Res Function(MapInitial) _then)
      : super(_value, (v) => _then(v as MapInitial));

  @override
  MapInitial get _value => super._value as MapInitial;
}

class _$MapInitial implements MapInitial {
  const _$MapInitial();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MapInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MapInitial implements MapState {
  const factory MapInitial() = _$MapInitial;
}

abstract class $MapBroadcastingCopyWith<$Res> {
  factory $MapBroadcastingCopyWith(
          MapBroadcasting value, $Res Function(MapBroadcasting) then) =
      _$MapBroadcastingCopyWithImpl<$Res>;
  $Res call({Buddy buddy, Stream<Location> stream, Location location});
}

class _$MapBroadcastingCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements $MapBroadcastingCopyWith<$Res> {
  _$MapBroadcastingCopyWithImpl(
      MapBroadcasting _value, $Res Function(MapBroadcasting) _then)
      : super(_value, (v) => _then(v as MapBroadcasting));

  @override
  MapBroadcasting get _value => super._value as MapBroadcasting;

  @override
  $Res call({
    Object buddy = freezed,
    Object stream = freezed,
    Object location = freezed,
  }) {
    return _then(MapBroadcasting(
      buddy == freezed ? _value.buddy : buddy as Buddy,
      stream == freezed ? _value.stream : stream as Stream<Location>,
      location == freezed ? _value.location : location as Location,
    ));
  }
}

class _$MapBroadcasting implements MapBroadcasting {
  const _$MapBroadcasting(this.buddy, this.stream, this.location)
      : assert(buddy != null),
        assert(stream != null),
        assert(location != null);

  @override
  final Buddy buddy;
  @override
  final Stream<Location> stream;
  @override
  final Location location;

  @override
  String toString() {
    return 'MapState.broadcasting(buddy: $buddy, stream: $stream, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MapBroadcasting &&
            (identical(other.buddy, buddy) ||
                const DeepCollectionEquality().equals(other.buddy, buddy)) &&
            (identical(other.stream, stream) ||
                const DeepCollectionEquality().equals(other.stream, stream)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(buddy) ^
      const DeepCollectionEquality().hash(stream) ^
      const DeepCollectionEquality().hash(location);

  @override
  $MapBroadcastingCopyWith<MapBroadcasting> get copyWith =>
      _$MapBroadcastingCopyWithImpl<MapBroadcasting>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcasting(buddy, stream, location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcasting != null) {
      return broadcasting(buddy, stream, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcasting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcasting != null) {
      return broadcasting(this);
    }
    return orElse();
  }
}

abstract class MapBroadcasting implements MapState {
  const factory MapBroadcasting(
          Buddy buddy, Stream<Location> stream, Location location) =
      _$MapBroadcasting;

  Buddy get buddy;
  Stream<Location> get stream;
  Location get location;
  $MapBroadcastingCopyWith<MapBroadcasting> get copyWith;
}

abstract class $MapNotBroadcastingCopyWith<$Res> {
  factory $MapNotBroadcastingCopyWith(
          MapNotBroadcasting value, $Res Function(MapNotBroadcasting) then) =
      _$MapNotBroadcastingCopyWithImpl<$Res>;
  $Res call({Location location});
}

class _$MapNotBroadcastingCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res>
    implements $MapNotBroadcastingCopyWith<$Res> {
  _$MapNotBroadcastingCopyWithImpl(
      MapNotBroadcasting _value, $Res Function(MapNotBroadcasting) _then)
      : super(_value, (v) => _then(v as MapNotBroadcasting));

  @override
  MapNotBroadcasting get _value => super._value as MapNotBroadcasting;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(MapNotBroadcasting(
      location == freezed ? _value.location : location as Location,
    ));
  }
}

class _$MapNotBroadcasting implements MapNotBroadcasting {
  const _$MapNotBroadcasting(this.location) : assert(location != null);

  @override
  final Location location;

  @override
  String toString() {
    return 'MapState.notBroadcasting(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MapNotBroadcasting &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  $MapNotBroadcastingCopyWith<MapNotBroadcasting> get copyWith =>
      _$MapNotBroadcastingCopyWithImpl<MapNotBroadcasting>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return notBroadcasting(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notBroadcasting != null) {
      return notBroadcasting(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return notBroadcasting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notBroadcasting != null) {
      return notBroadcasting(this);
    }
    return orElse();
  }
}

abstract class MapNotBroadcasting implements MapState {
  const factory MapNotBroadcasting(Location location) = _$MapNotBroadcasting;

  Location get location;
  $MapNotBroadcastingCopyWith<MapNotBroadcasting> get copyWith;
}

abstract class $BroadcastErrorCopyWith<$Res> {
  factory $BroadcastErrorCopyWith(
          BroadcastError value, $Res Function(BroadcastError) then) =
      _$BroadcastErrorCopyWithImpl<$Res>;
}

class _$BroadcastErrorCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements $BroadcastErrorCopyWith<$Res> {
  _$BroadcastErrorCopyWithImpl(
      BroadcastError _value, $Res Function(BroadcastError) _then)
      : super(_value, (v) => _then(v as BroadcastError));

  @override
  BroadcastError get _value => super._value as BroadcastError;
}

class _$BroadcastError implements BroadcastError {
  const _$BroadcastError();

  @override
  String toString() {
    return 'MapState.broadcastError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BroadcastError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastError != null) {
      return broadcastError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastError != null) {
      return broadcastError(this);
    }
    return orElse();
  }
}

abstract class BroadcastError implements MapState {
  const factory BroadcastError() = _$BroadcastError;
}

abstract class $MapLoadingCopyWith<$Res> {
  factory $MapLoadingCopyWith(
          MapLoading value, $Res Function(MapLoading) then) =
      _$MapLoadingCopyWithImpl<$Res>;
}

class _$MapLoadingCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements $MapLoadingCopyWith<$Res> {
  _$MapLoadingCopyWithImpl(MapLoading _value, $Res Function(MapLoading) _then)
      : super(_value, (v) => _then(v as MapLoading));

  @override
  MapLoading get _value => super._value as MapLoading;
}

class _$MapLoading implements MapLoading {
  const _$MapLoading();

  @override
  String toString() {
    return 'MapState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MapLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result broadcasting(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result notBroadcasting(Location location),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(
        Buddy buddy, Stream<Location> stream, Location location),
    Result notBroadcasting(Location location),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result broadcasting(MapBroadcasting value),
    @required Result notBroadcasting(MapNotBroadcasting value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    assert(broadcastError != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result broadcasting(MapBroadcasting value),
    Result notBroadcasting(MapNotBroadcasting value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MapLoading implements MapState {
  const factory MapLoading() = _$MapLoading;
}
