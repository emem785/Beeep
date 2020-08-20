// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'lawyer_tiles_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LawyerTilesStateTearOff {
  const _$LawyerTilesStateTearOff();

  LawyerTilesInitial initial() {
    return const LawyerTilesInitial();
  }

  LawyerEngaged lawyerEngaged(List<int> engagedLawyersIndex) {
    return LawyerEngaged(
      engagedLawyersIndex,
    );
  }
}

// ignore: unused_element
const $LawyerTilesState = _$LawyerTilesStateTearOff();

mixin _$LawyerTilesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result lawyerEngaged(List<int> engagedLawyersIndex),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result lawyerEngaged(List<int> engagedLawyersIndex),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerEngaged(LawyerEngaged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerEngaged(LawyerEngaged value),
    @required Result orElse(),
  });
}

abstract class $LawyerTilesStateCopyWith<$Res> {
  factory $LawyerTilesStateCopyWith(
          LawyerTilesState value, $Res Function(LawyerTilesState) then) =
      _$LawyerTilesStateCopyWithImpl<$Res>;
}

class _$LawyerTilesStateCopyWithImpl<$Res>
    implements $LawyerTilesStateCopyWith<$Res> {
  _$LawyerTilesStateCopyWithImpl(this._value, this._then);

  final LawyerTilesState _value;
  // ignore: unused_field
  final $Res Function(LawyerTilesState) _then;
}

abstract class $LawyerTilesInitialCopyWith<$Res> {
  factory $LawyerTilesInitialCopyWith(
          LawyerTilesInitial value, $Res Function(LawyerTilesInitial) then) =
      _$LawyerTilesInitialCopyWithImpl<$Res>;
}

class _$LawyerTilesInitialCopyWithImpl<$Res>
    extends _$LawyerTilesStateCopyWithImpl<$Res>
    implements $LawyerTilesInitialCopyWith<$Res> {
  _$LawyerTilesInitialCopyWithImpl(
      LawyerTilesInitial _value, $Res Function(LawyerTilesInitial) _then)
      : super(_value, (v) => _then(v as LawyerTilesInitial));

  @override
  LawyerTilesInitial get _value => super._value as LawyerTilesInitial;
}

class _$LawyerTilesInitial implements LawyerTilesInitial {
  const _$LawyerTilesInitial();

  @override
  String toString() {
    return 'LawyerTilesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LawyerTilesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result lawyerEngaged(List<int> engagedLawyersIndex),
  }) {
    assert(initial != null);
    assert(lawyerEngaged != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result lawyerEngaged(List<int> engagedLawyersIndex),
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
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerEngaged(LawyerEngaged value),
  }) {
    assert(initial != null);
    assert(lawyerEngaged != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerEngaged(LawyerEngaged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LawyerTilesInitial implements LawyerTilesState {
  const factory LawyerTilesInitial() = _$LawyerTilesInitial;
}

abstract class $LawyerEngagedCopyWith<$Res> {
  factory $LawyerEngagedCopyWith(
          LawyerEngaged value, $Res Function(LawyerEngaged) then) =
      _$LawyerEngagedCopyWithImpl<$Res>;
  $Res call({List<int> engagedLawyersIndex});
}

class _$LawyerEngagedCopyWithImpl<$Res>
    extends _$LawyerTilesStateCopyWithImpl<$Res>
    implements $LawyerEngagedCopyWith<$Res> {
  _$LawyerEngagedCopyWithImpl(
      LawyerEngaged _value, $Res Function(LawyerEngaged) _then)
      : super(_value, (v) => _then(v as LawyerEngaged));

  @override
  LawyerEngaged get _value => super._value as LawyerEngaged;

  @override
  $Res call({
    Object engagedLawyersIndex = freezed,
  }) {
    return _then(LawyerEngaged(
      engagedLawyersIndex == freezed
          ? _value.engagedLawyersIndex
          : engagedLawyersIndex as List<int>,
    ));
  }
}

class _$LawyerEngaged implements LawyerEngaged {
  const _$LawyerEngaged(this.engagedLawyersIndex)
      : assert(engagedLawyersIndex != null);

  @override
  final List<int> engagedLawyersIndex;

  @override
  String toString() {
    return 'LawyerTilesState.lawyerEngaged(engagedLawyersIndex: $engagedLawyersIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LawyerEngaged &&
            (identical(other.engagedLawyersIndex, engagedLawyersIndex) ||
                const DeepCollectionEquality()
                    .equals(other.engagedLawyersIndex, engagedLawyersIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(engagedLawyersIndex);

  @override
  $LawyerEngagedCopyWith<LawyerEngaged> get copyWith =>
      _$LawyerEngagedCopyWithImpl<LawyerEngaged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result lawyerEngaged(List<int> engagedLawyersIndex),
  }) {
    assert(initial != null);
    assert(lawyerEngaged != null);
    return lawyerEngaged(engagedLawyersIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result lawyerEngaged(List<int> engagedLawyersIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lawyerEngaged != null) {
      return lawyerEngaged(engagedLawyersIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerEngaged(LawyerEngaged value),
  }) {
    assert(initial != null);
    assert(lawyerEngaged != null);
    return lawyerEngaged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerEngaged(LawyerEngaged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lawyerEngaged != null) {
      return lawyerEngaged(this);
    }
    return orElse();
  }
}

abstract class LawyerEngaged implements LawyerTilesState {
  const factory LawyerEngaged(List<int> engagedLawyersIndex) = _$LawyerEngaged;

  List<int> get engagedLawyersIndex;
  $LawyerEngagedCopyWith<LawyerEngaged> get copyWith;
}
