// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lawyer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LawyerEventTearOff {
  const _$LawyerEventTearOff();

// ignore: unused_element
  GetLawyers getLawyers() {
    return const GetLawyers();
  }
}

// ignore: unused_element
const $LawyerEvent = _$LawyerEventTearOff();

mixin _$LawyerEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLawyers(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLawyers(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLawyers(GetLawyers value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLawyers(GetLawyers value),
    @required Result orElse(),
  });
}

abstract class $LawyerEventCopyWith<$Res> {
  factory $LawyerEventCopyWith(
          LawyerEvent value, $Res Function(LawyerEvent) then) =
      _$LawyerEventCopyWithImpl<$Res>;
}

class _$LawyerEventCopyWithImpl<$Res> implements $LawyerEventCopyWith<$Res> {
  _$LawyerEventCopyWithImpl(this._value, this._then);

  final LawyerEvent _value;
  // ignore: unused_field
  final $Res Function(LawyerEvent) _then;
}

abstract class $GetLawyersCopyWith<$Res> {
  factory $GetLawyersCopyWith(
          GetLawyers value, $Res Function(GetLawyers) then) =
      _$GetLawyersCopyWithImpl<$Res>;
}

class _$GetLawyersCopyWithImpl<$Res> extends _$LawyerEventCopyWithImpl<$Res>
    implements $GetLawyersCopyWith<$Res> {
  _$GetLawyersCopyWithImpl(GetLawyers _value, $Res Function(GetLawyers) _then)
      : super(_value, (v) => _then(v as GetLawyers));

  @override
  GetLawyers get _value => super._value as GetLawyers;
}

class _$GetLawyers implements GetLawyers {
  const _$GetLawyers();

  @override
  String toString() {
    return 'LawyerEvent.getLawyers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetLawyers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getLawyers(),
  }) {
    assert(getLawyers != null);
    return getLawyers();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getLawyers(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLawyers != null) {
      return getLawyers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getLawyers(GetLawyers value),
  }) {
    assert(getLawyers != null);
    return getLawyers(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getLawyers(GetLawyers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLawyers != null) {
      return getLawyers(this);
    }
    return orElse();
  }
}

abstract class GetLawyers implements LawyerEvent {
  const factory GetLawyers() = _$GetLawyers;
}

class _$LawyerStateTearOff {
  const _$LawyerStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Error error(Failure failure) {
    return Error(
      failure,
    );
  }

// ignore: unused_element
  Loaded loaded(List<Lawyer> lawyers) {
    return Loaded(
      lawyers,
    );
  }
}

// ignore: unused_element
const $LawyerState = _$LawyerStateTearOff();

mixin _$LawyerState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Failure failure),
    @required Result loaded(List<Lawyer> lawyers),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Failure failure),
    Result loaded(List<Lawyer> lawyers),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result loaded(Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result error(Error value),
    Result loaded(Loaded value),
    @required Result orElse(),
  });
}

abstract class $LawyerStateCopyWith<$Res> {
  factory $LawyerStateCopyWith(
          LawyerState value, $Res Function(LawyerState) then) =
      _$LawyerStateCopyWithImpl<$Res>;
}

class _$LawyerStateCopyWithImpl<$Res> implements $LawyerStateCopyWith<$Res> {
  _$LawyerStateCopyWithImpl(this._value, this._then);

  final LawyerState _value;
  // ignore: unused_field
  final $Res Function(LawyerState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$LawyerStateCopyWithImpl<$Res>
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
    return 'LawyerState.initial()';
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
    @required Result loading(),
    @required Result error(Failure failure),
    @required Result loaded(List<Lawyer> lawyers),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Failure failure),
    Result loaded(List<Lawyer> lawyers),
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
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result error(Error value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements LawyerState {
  const factory Initial() = _$Initial;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$LawyerStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'LawyerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Failure failure),
    @required Result loaded(List<Lawyer> lawyers),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Failure failure),
    Result loaded(List<Lawyer> lawyers),
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
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result error(Error value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LawyerState {
  const factory Loading() = _$Loading;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

class _$ErrorCopyWithImpl<$Res> extends _$LawyerStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(Error(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }

  @override
  $FailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$Error implements Error {
  const _$Error(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'LawyerState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Failure failure),
    @required Result loaded(List<Lawyer> lawyers),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Failure failure),
    Result loaded(List<Lawyer> lawyers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result error(Error value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements LawyerState {
  const factory Error(Failure failure) = _$Error;

  Failure get failure;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<Lawyer> lawyers});
}

class _$LoadedCopyWithImpl<$Res> extends _$LawyerStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object lawyers = freezed,
  }) {
    return _then(Loaded(
      lawyers == freezed ? _value.lawyers : lawyers as List<Lawyer>,
    ));
  }
}

class _$Loaded implements Loaded {
  const _$Loaded(this.lawyers) : assert(lawyers != null);

  @override
  final List<Lawyer> lawyers;

  @override
  String toString() {
    return 'LawyerState.loaded(lawyers: $lawyers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.lawyers, lawyers) ||
                const DeepCollectionEquality().equals(other.lawyers, lawyers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lawyers);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result error(Failure failure),
    @required Result loaded(List<Lawyer> lawyers),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(lawyers);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result error(Failure failure),
    Result loaded(List<Lawyer> lawyers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(lawyers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result error(Error value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result error(Error value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements LawyerState {
  const factory Loaded(List<Lawyer> lawyers) = _$Loaded;

  List<Lawyer> get lawyers;
  $LoadedCopyWith<Loaded> get copyWith;
}
