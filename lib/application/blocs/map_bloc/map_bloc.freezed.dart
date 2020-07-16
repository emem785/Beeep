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

  ReceivingBroadcast receivingBroadcast(
      Buddy buddy, Stream<Location> stream, Location location) {
    return ReceivingBroadcast(
      buddy,
      stream,
      location,
    );
  }

  BroadcastEnded broadcastEnded() {
    return const BroadcastEnded();
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
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
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
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
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
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
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

abstract class $ReceivingBroadcastCopyWith<$Res> {
  factory $ReceivingBroadcastCopyWith(
          ReceivingBroadcast value, $Res Function(ReceivingBroadcast) then) =
      _$ReceivingBroadcastCopyWithImpl<$Res>;
  $Res call({Buddy buddy, Stream<Location> stream, Location location});
}

class _$ReceivingBroadcastCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res>
    implements $ReceivingBroadcastCopyWith<$Res> {
  _$ReceivingBroadcastCopyWithImpl(
      ReceivingBroadcast _value, $Res Function(ReceivingBroadcast) _then)
      : super(_value, (v) => _then(v as ReceivingBroadcast));

  @override
  ReceivingBroadcast get _value => super._value as ReceivingBroadcast;

  @override
  $Res call({
    Object buddy = freezed,
    Object stream = freezed,
    Object location = freezed,
  }) {
    return _then(ReceivingBroadcast(
      buddy == freezed ? _value.buddy : buddy as Buddy,
      stream == freezed ? _value.stream : stream as Stream<Location>,
      location == freezed ? _value.location : location as Location,
    ));
  }
}

class _$ReceivingBroadcast implements ReceivingBroadcast {
  const _$ReceivingBroadcast(this.buddy, this.stream, this.location)
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
    return 'MapState.receivingBroadcast(buddy: $buddy, stream: $stream, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceivingBroadcast &&
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
  $ReceivingBroadcastCopyWith<ReceivingBroadcast> get copyWith =>
      _$ReceivingBroadcastCopyWithImpl<ReceivingBroadcast>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return receivingBroadcast(buddy, stream, location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (receivingBroadcast != null) {
      return receivingBroadcast(buddy, stream, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return receivingBroadcast(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (receivingBroadcast != null) {
      return receivingBroadcast(this);
    }
    return orElse();
  }
}

abstract class ReceivingBroadcast implements MapState {
  const factory ReceivingBroadcast(
          Buddy buddy, Stream<Location> stream, Location location) =
      _$ReceivingBroadcast;

  Buddy get buddy;
  Stream<Location> get stream;
  Location get location;
  $ReceivingBroadcastCopyWith<ReceivingBroadcast> get copyWith;
}

abstract class $BroadcastEndedCopyWith<$Res> {
  factory $BroadcastEndedCopyWith(
          BroadcastEnded value, $Res Function(BroadcastEnded) then) =
      _$BroadcastEndedCopyWithImpl<$Res>;
}

class _$BroadcastEndedCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements $BroadcastEndedCopyWith<$Res> {
  _$BroadcastEndedCopyWithImpl(
      BroadcastEnded _value, $Res Function(BroadcastEnded) _then)
      : super(_value, (v) => _then(v as BroadcastEnded));

  @override
  BroadcastEnded get _value => super._value as BroadcastEnded;
}

class _$BroadcastEnded implements BroadcastEnded {
  const _$BroadcastEnded();

  @override
  String toString() {
    return 'MapState.broadcastEnded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BroadcastEnded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastEnded();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
    Result broadcastError(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastEnded != null) {
      return broadcastEnded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(MapInitial value),
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastEnded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
    Result broadcastError(BroadcastError value),
    Result loading(MapLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastEnded != null) {
      return broadcastEnded(this);
    }
    return orElse();
  }
}

abstract class BroadcastEnded implements MapState {
  const factory BroadcastEnded() = _$BroadcastEnded;
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
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
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
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return broadcastError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
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
        Result receivingBroadcast(
            Buddy buddy, Stream<Location> stream, Location location),
    @required Result broadcastEnded(),
    @required Result broadcastError(),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result receivingBroadcast(
        Buddy buddy, Stream<Location> stream, Location location),
    Result broadcastEnded(),
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
    @required Result receivingBroadcast(ReceivingBroadcast value),
    @required Result broadcastEnded(BroadcastEnded value),
    @required Result broadcastError(BroadcastError value),
    @required Result loading(MapLoading value),
  }) {
    assert(initial != null);
    assert(receivingBroadcast != null);
    assert(broadcastEnded != null);
    assert(broadcastError != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(MapInitial value),
    Result receivingBroadcast(ReceivingBroadcast value),
    Result broadcastEnded(BroadcastEnded value),
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
