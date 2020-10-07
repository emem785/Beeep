// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lawyer_tiles_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LawyerTilesStateTearOff {
  const _$LawyerTilesStateTearOff();

// ignore: unused_element
  LawyerTilesInitial initial(Set<String> engagedLawyersIndex) {
    return LawyerTilesInitial(
      engagedLawyersIndex,
    );
  }

// ignore: unused_element
  LawyerSelected lawyerSelected(String index) {
    return LawyerSelected(
      index,
    );
  }

// ignore: unused_element
  LawyerEngaged lawyerEngaged(Set<String> engagedLawyersIndex) {
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
    @required Result initial(Set<String> engagedLawyersIndex),
    @required Result lawyerSelected(String index),
    @required Result lawyerEngaged(Set<String> engagedLawyersIndex),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Set<String> engagedLawyersIndex),
    Result lawyerSelected(String index),
    Result lawyerEngaged(Set<String> engagedLawyersIndex),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerSelected(LawyerSelected value),
    @required Result lawyerEngaged(LawyerEngaged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerSelected(LawyerSelected value),
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
  $Res call({Set<String> engagedLawyersIndex});
}

class _$LawyerTilesInitialCopyWithImpl<$Res>
    extends _$LawyerTilesStateCopyWithImpl<$Res>
    implements $LawyerTilesInitialCopyWith<$Res> {
  _$LawyerTilesInitialCopyWithImpl(
      LawyerTilesInitial _value, $Res Function(LawyerTilesInitial) _then)
      : super(_value, (v) => _then(v as LawyerTilesInitial));

  @override
  LawyerTilesInitial get _value => super._value as LawyerTilesInitial;

  @override
  $Res call({
    Object engagedLawyersIndex = freezed,
  }) {
    return _then(LawyerTilesInitial(
      engagedLawyersIndex == freezed
          ? _value.engagedLawyersIndex
          : engagedLawyersIndex as Set<String>,
    ));
  }
}

class _$LawyerTilesInitial implements LawyerTilesInitial {
  const _$LawyerTilesInitial(this.engagedLawyersIndex)
      : assert(engagedLawyersIndex != null);

  @override
  final Set<String> engagedLawyersIndex;

  @override
  String toString() {
    return 'LawyerTilesState.initial(engagedLawyersIndex: $engagedLawyersIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LawyerTilesInitial &&
            (identical(other.engagedLawyersIndex, engagedLawyersIndex) ||
                const DeepCollectionEquality()
                    .equals(other.engagedLawyersIndex, engagedLawyersIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(engagedLawyersIndex);

  @override
  $LawyerTilesInitialCopyWith<LawyerTilesInitial> get copyWith =>
      _$LawyerTilesInitialCopyWithImpl<LawyerTilesInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Set<String> engagedLawyersIndex),
    @required Result lawyerSelected(String index),
    @required Result lawyerEngaged(Set<String> engagedLawyersIndex),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return initial(engagedLawyersIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Set<String> engagedLawyersIndex),
    Result lawyerSelected(String index),
    Result lawyerEngaged(Set<String> engagedLawyersIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(engagedLawyersIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerSelected(LawyerSelected value),
    @required Result lawyerEngaged(LawyerEngaged value),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerSelected(LawyerSelected value),
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
  const factory LawyerTilesInitial(Set<String> engagedLawyersIndex) =
      _$LawyerTilesInitial;

  Set<String> get engagedLawyersIndex;
  $LawyerTilesInitialCopyWith<LawyerTilesInitial> get copyWith;
}

abstract class $LawyerSelectedCopyWith<$Res> {
  factory $LawyerSelectedCopyWith(
          LawyerSelected value, $Res Function(LawyerSelected) then) =
      _$LawyerSelectedCopyWithImpl<$Res>;
  $Res call({String index});
}

class _$LawyerSelectedCopyWithImpl<$Res>
    extends _$LawyerTilesStateCopyWithImpl<$Res>
    implements $LawyerSelectedCopyWith<$Res> {
  _$LawyerSelectedCopyWithImpl(
      LawyerSelected _value, $Res Function(LawyerSelected) _then)
      : super(_value, (v) => _then(v as LawyerSelected));

  @override
  LawyerSelected get _value => super._value as LawyerSelected;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(LawyerSelected(
      index == freezed ? _value.index : index as String,
    ));
  }
}

class _$LawyerSelected implements LawyerSelected {
  const _$LawyerSelected(this.index) : assert(index != null);

  @override
  final String index;

  @override
  String toString() {
    return 'LawyerTilesState.lawyerSelected(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LawyerSelected &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  $LawyerSelectedCopyWith<LawyerSelected> get copyWith =>
      _$LawyerSelectedCopyWithImpl<LawyerSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(Set<String> engagedLawyersIndex),
    @required Result lawyerSelected(String index),
    @required Result lawyerEngaged(Set<String> engagedLawyersIndex),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return lawyerSelected(index);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Set<String> engagedLawyersIndex),
    Result lawyerSelected(String index),
    Result lawyerEngaged(Set<String> engagedLawyersIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lawyerSelected != null) {
      return lawyerSelected(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(LawyerTilesInitial value),
    @required Result lawyerSelected(LawyerSelected value),
    @required Result lawyerEngaged(LawyerEngaged value),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return lawyerSelected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerSelected(LawyerSelected value),
    Result lawyerEngaged(LawyerEngaged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lawyerSelected != null) {
      return lawyerSelected(this);
    }
    return orElse();
  }
}

abstract class LawyerSelected implements LawyerTilesState {
  const factory LawyerSelected(String index) = _$LawyerSelected;

  String get index;
  $LawyerSelectedCopyWith<LawyerSelected> get copyWith;
}

abstract class $LawyerEngagedCopyWith<$Res> {
  factory $LawyerEngagedCopyWith(
          LawyerEngaged value, $Res Function(LawyerEngaged) then) =
      _$LawyerEngagedCopyWithImpl<$Res>;
  $Res call({Set<String> engagedLawyersIndex});
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
          : engagedLawyersIndex as Set<String>,
    ));
  }
}

class _$LawyerEngaged implements LawyerEngaged {
  const _$LawyerEngaged(this.engagedLawyersIndex)
      : assert(engagedLawyersIndex != null);

  @override
  final Set<String> engagedLawyersIndex;

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
    @required Result initial(Set<String> engagedLawyersIndex),
    @required Result lawyerSelected(String index),
    @required Result lawyerEngaged(Set<String> engagedLawyersIndex),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return lawyerEngaged(engagedLawyersIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(Set<String> engagedLawyersIndex),
    Result lawyerSelected(String index),
    Result lawyerEngaged(Set<String> engagedLawyersIndex),
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
    @required Result lawyerSelected(LawyerSelected value),
    @required Result lawyerEngaged(LawyerEngaged value),
  }) {
    assert(initial != null);
    assert(lawyerSelected != null);
    assert(lawyerEngaged != null);
    return lawyerEngaged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(LawyerTilesInitial value),
    Result lawyerSelected(LawyerSelected value),
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
  const factory LawyerEngaged(Set<String> engagedLawyersIndex) =
      _$LawyerEngaged;

  Set<String> get engagedLawyersIndex;
  $LawyerEngagedCopyWith<LawyerEngaged> get copyWith;
}
