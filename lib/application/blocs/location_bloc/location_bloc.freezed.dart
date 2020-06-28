// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LocationEventTearOff {
  const _$LocationEventTearOff();

  BroadcastLocation broadcastLocation() {
    return const BroadcastLocation();
  }

  StopBroadcast stopBroadcast() {
    return const StopBroadcast();
  }

  ResumeBroadcast resume() {
    return const ResumeBroadcast();
  }
}

// ignore: unused_element
const $LocationEvent = _$LocationEventTearOff();

mixin _$LocationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result broadcastLocation(),
    @required Result stopBroadcast(),
    @required Result resume(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result broadcastLocation(),
    Result stopBroadcast(),
    Result resume(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result broadcastLocation(BroadcastLocation value),
    @required Result stopBroadcast(StopBroadcast value),
    @required Result resume(ResumeBroadcast value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result broadcastLocation(BroadcastLocation value),
    Result stopBroadcast(StopBroadcast value),
    Result resume(ResumeBroadcast value),
    @required Result orElse(),
  });
}

abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res>;
}

class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  final LocationEvent _value;
  // ignore: unused_field
  final $Res Function(LocationEvent) _then;
}

abstract class $BroadcastLocationCopyWith<$Res> {
  factory $BroadcastLocationCopyWith(
          BroadcastLocation value, $Res Function(BroadcastLocation) then) =
      _$BroadcastLocationCopyWithImpl<$Res>;
}

class _$BroadcastLocationCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $BroadcastLocationCopyWith<$Res> {
  _$BroadcastLocationCopyWithImpl(
      BroadcastLocation _value, $Res Function(BroadcastLocation) _then)
      : super(_value, (v) => _then(v as BroadcastLocation));

  @override
  BroadcastLocation get _value => super._value as BroadcastLocation;
}

class _$BroadcastLocation implements BroadcastLocation {
  const _$BroadcastLocation();

  @override
  String toString() {
    return 'LocationEvent.broadcastLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BroadcastLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result broadcastLocation(),
    @required Result stopBroadcast(),
    @required Result resume(),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return broadcastLocation();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result broadcastLocation(),
    Result stopBroadcast(),
    Result resume(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastLocation != null) {
      return broadcastLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result broadcastLocation(BroadcastLocation value),
    @required Result stopBroadcast(StopBroadcast value),
    @required Result resume(ResumeBroadcast value),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return broadcastLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result broadcastLocation(BroadcastLocation value),
    Result stopBroadcast(StopBroadcast value),
    Result resume(ResumeBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcastLocation != null) {
      return broadcastLocation(this);
    }
    return orElse();
  }
}

abstract class BroadcastLocation implements LocationEvent {
  const factory BroadcastLocation() = _$BroadcastLocation;
}

abstract class $StopBroadcastCopyWith<$Res> {
  factory $StopBroadcastCopyWith(
          StopBroadcast value, $Res Function(StopBroadcast) then) =
      _$StopBroadcastCopyWithImpl<$Res>;
}

class _$StopBroadcastCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $StopBroadcastCopyWith<$Res> {
  _$StopBroadcastCopyWithImpl(
      StopBroadcast _value, $Res Function(StopBroadcast) _then)
      : super(_value, (v) => _then(v as StopBroadcast));

  @override
  StopBroadcast get _value => super._value as StopBroadcast;
}

class _$StopBroadcast implements StopBroadcast {
  const _$StopBroadcast();

  @override
  String toString() {
    return 'LocationEvent.stopBroadcast()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StopBroadcast);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result broadcastLocation(),
    @required Result stopBroadcast(),
    @required Result resume(),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return stopBroadcast();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result broadcastLocation(),
    Result stopBroadcast(),
    Result resume(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stopBroadcast != null) {
      return stopBroadcast();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result broadcastLocation(BroadcastLocation value),
    @required Result stopBroadcast(StopBroadcast value),
    @required Result resume(ResumeBroadcast value),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return stopBroadcast(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result broadcastLocation(BroadcastLocation value),
    Result stopBroadcast(StopBroadcast value),
    Result resume(ResumeBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stopBroadcast != null) {
      return stopBroadcast(this);
    }
    return orElse();
  }
}

abstract class StopBroadcast implements LocationEvent {
  const factory StopBroadcast() = _$StopBroadcast;
}

abstract class $ResumeBroadcastCopyWith<$Res> {
  factory $ResumeBroadcastCopyWith(
          ResumeBroadcast value, $Res Function(ResumeBroadcast) then) =
      _$ResumeBroadcastCopyWithImpl<$Res>;
}

class _$ResumeBroadcastCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $ResumeBroadcastCopyWith<$Res> {
  _$ResumeBroadcastCopyWithImpl(
      ResumeBroadcast _value, $Res Function(ResumeBroadcast) _then)
      : super(_value, (v) => _then(v as ResumeBroadcast));

  @override
  ResumeBroadcast get _value => super._value as ResumeBroadcast;
}

class _$ResumeBroadcast implements ResumeBroadcast {
  const _$ResumeBroadcast();

  @override
  String toString() {
    return 'LocationEvent.resume()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResumeBroadcast);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result broadcastLocation(),
    @required Result stopBroadcast(),
    @required Result resume(),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result broadcastLocation(),
    Result stopBroadcast(),
    Result resume(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result broadcastLocation(BroadcastLocation value),
    @required Result stopBroadcast(StopBroadcast value),
    @required Result resume(ResumeBroadcast value),
  }) {
    assert(broadcastLocation != null);
    assert(stopBroadcast != null);
    assert(resume != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result broadcastLocation(BroadcastLocation value),
    Result stopBroadcast(StopBroadcast value),
    Result resume(ResumeBroadcast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class ResumeBroadcast implements LocationEvent {
  const factory ResumeBroadcast() = _$ResumeBroadcast;
}

class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Broadcasting broadcasting() {
    return const Broadcasting();
  }

  NotBroadcasting notBroadcasting() {
    return const NotBroadcasting();
  }
}

// ignore: unused_element
const $LocationState = _$LocationStateTearOff();

mixin _$LocationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result broadcasting(),
    @required Result notBroadcasting(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(),
    Result notBroadcasting(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result broadcasting(Broadcasting value),
    @required Result notBroadcasting(NotBroadcasting value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result broadcasting(Broadcasting value),
    Result notBroadcasting(NotBroadcasting value),
    @required Result orElse(),
  });
}

abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'LocationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result broadcasting(),
    @required Result notBroadcasting(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(),
    Result notBroadcasting(),
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
    @required Result initial(Initial value),
    @required Result broadcasting(Broadcasting value),
    @required Result notBroadcasting(NotBroadcasting value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result broadcasting(Broadcasting value),
    Result notBroadcasting(NotBroadcasting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements LocationState {
  const factory Initial() = _$Initial;
}

abstract class $BroadcastingCopyWith<$Res> {
  factory $BroadcastingCopyWith(
          Broadcasting value, $Res Function(Broadcasting) then) =
      _$BroadcastingCopyWithImpl<$Res>;
}

class _$BroadcastingCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
    implements $BroadcastingCopyWith<$Res> {
  _$BroadcastingCopyWithImpl(
      Broadcasting _value, $Res Function(Broadcasting) _then)
      : super(_value, (v) => _then(v as Broadcasting));

  @override
  Broadcasting get _value => super._value as Broadcasting;
}

class _$Broadcasting implements Broadcasting {
  const _$Broadcasting();

  @override
  String toString() {
    return 'LocationState.broadcasting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Broadcasting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result broadcasting(),
    @required Result notBroadcasting(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return broadcasting();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(),
    Result notBroadcasting(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcasting != null) {
      return broadcasting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result broadcasting(Broadcasting value),
    @required Result notBroadcasting(NotBroadcasting value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return broadcasting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result broadcasting(Broadcasting value),
    Result notBroadcasting(NotBroadcasting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (broadcasting != null) {
      return broadcasting(this);
    }
    return orElse();
  }
}

abstract class Broadcasting implements LocationState {
  const factory Broadcasting() = _$Broadcasting;
}

abstract class $NotBroadcastingCopyWith<$Res> {
  factory $NotBroadcastingCopyWith(
          NotBroadcasting value, $Res Function(NotBroadcasting) then) =
      _$NotBroadcastingCopyWithImpl<$Res>;
}

class _$NotBroadcastingCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $NotBroadcastingCopyWith<$Res> {
  _$NotBroadcastingCopyWithImpl(
      NotBroadcasting _value, $Res Function(NotBroadcasting) _then)
      : super(_value, (v) => _then(v as NotBroadcasting));

  @override
  NotBroadcasting get _value => super._value as NotBroadcasting;
}

class _$NotBroadcasting implements NotBroadcasting {
  const _$NotBroadcasting();

  @override
  String toString() {
    return 'LocationState.notBroadcasting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotBroadcasting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result broadcasting(),
    @required Result notBroadcasting(),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return notBroadcasting();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result broadcasting(),
    Result notBroadcasting(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notBroadcasting != null) {
      return notBroadcasting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result broadcasting(Broadcasting value),
    @required Result notBroadcasting(NotBroadcasting value),
  }) {
    assert(initial != null);
    assert(broadcasting != null);
    assert(notBroadcasting != null);
    return notBroadcasting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result broadcasting(Broadcasting value),
    Result notBroadcasting(NotBroadcasting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notBroadcasting != null) {
      return notBroadcasting(this);
    }
    return orElse();
  }
}

abstract class NotBroadcasting implements LocationState {
  const factory NotBroadcasting() = _$NotBroadcasting;
}
