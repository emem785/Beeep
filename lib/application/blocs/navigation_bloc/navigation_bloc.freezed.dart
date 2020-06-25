// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  ChangeNavState changeNavState(int i) {
    return ChangeNavState(
      i,
    );
  }
}

// ignore: unused_element
const $NavigationEvent = _$NavigationEventTearOff();

mixin _$NavigationEvent {
  int get i;

  $NavigationEventCopyWith<NavigationEvent> get copyWith;
}

abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res>;
  $Res call({int i});
}

class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;
  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed ? _value.i : i as int,
    ));
  }
}

abstract class $ChangeNavStateCopyWith<$Res>
    implements $NavigationEventCopyWith<$Res> {
  factory $ChangeNavStateCopyWith(
          ChangeNavState value, $Res Function(ChangeNavState) then) =
      _$ChangeNavStateCopyWithImpl<$Res>;
  @override
  $Res call({int i});
}

class _$ChangeNavStateCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $ChangeNavStateCopyWith<$Res> {
  _$ChangeNavStateCopyWithImpl(
      ChangeNavState _value, $Res Function(ChangeNavState) _then)
      : super(_value, (v) => _then(v as ChangeNavState));

  @override
  ChangeNavState get _value => super._value as ChangeNavState;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(ChangeNavState(
      i == freezed ? _value.i : i as int,
    ));
  }
}

class _$ChangeNavState with DiagnosticableTreeMixin implements ChangeNavState {
  const _$ChangeNavState(this.i) : assert(i != null);

  @override
  final int i;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationEvent.changeNavState(i: $i)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationEvent.changeNavState'))
      ..add(DiagnosticsProperty('i', i));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeNavState &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(i);

  @override
  $ChangeNavStateCopyWith<ChangeNavState> get copyWith =>
      _$ChangeNavStateCopyWithImpl<ChangeNavState>(this, _$identity);
}

abstract class ChangeNavState implements NavigationEvent {
  const factory ChangeNavState(int i) = _$ChangeNavState;

  @override
  int get i;
  @override
  $ChangeNavStateCopyWith<ChangeNavState> get copyWith;
}

class _$NavigationStateTearOff {
  const _$NavigationStateTearOff();

  MapHome mapHome(double i) {
    return MapHome(
      i,
    );
  }

  ShowLawyers showLawyers(double i) {
    return ShowLawyers(
      i,
    );
  }

  Menu menu(double i) {
    return Menu(
      i,
    );
  }
}

// ignore: unused_element
const $NavigationState = _$NavigationStateTearOff();

mixin _$NavigationState {
  double get i;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result mapHome(double i),
    @required Result showLawyers(double i),
    @required Result menu(double i),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result mapHome(double i),
    Result showLawyers(double i),
    Result menu(double i),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result mapHome(MapHome value),
    @required Result showLawyers(ShowLawyers value),
    @required Result menu(Menu value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result mapHome(MapHome value),
    Result showLawyers(ShowLawyers value),
    Result menu(Menu value),
    @required Result orElse(),
  });

  $NavigationStateCopyWith<NavigationState> get copyWith;
}

abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call({double i});
}

class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed ? _value.i : i as double,
    ));
  }
}

abstract class $MapHomeCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory $MapHomeCopyWith(MapHome value, $Res Function(MapHome) then) =
      _$MapHomeCopyWithImpl<$Res>;
  @override
  $Res call({double i});
}

class _$MapHomeCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
    implements $MapHomeCopyWith<$Res> {
  _$MapHomeCopyWithImpl(MapHome _value, $Res Function(MapHome) _then)
      : super(_value, (v) => _then(v as MapHome));

  @override
  MapHome get _value => super._value as MapHome;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(MapHome(
      i == freezed ? _value.i : i as double,
    ));
  }
}

class _$MapHome with DiagnosticableTreeMixin implements MapHome {
  const _$MapHome(this.i) : assert(i != null);

  @override
  final double i;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationState.mapHome(i: $i)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationState.mapHome'))
      ..add(DiagnosticsProperty('i', i));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MapHome &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(i);

  @override
  $MapHomeCopyWith<MapHome> get copyWith =>
      _$MapHomeCopyWithImpl<MapHome>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result mapHome(double i),
    @required Result showLawyers(double i),
    @required Result menu(double i),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return mapHome(i);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result mapHome(double i),
    Result showLawyers(double i),
    Result menu(double i),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mapHome != null) {
      return mapHome(i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result mapHome(MapHome value),
    @required Result showLawyers(ShowLawyers value),
    @required Result menu(Menu value),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return mapHome(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result mapHome(MapHome value),
    Result showLawyers(ShowLawyers value),
    Result menu(Menu value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mapHome != null) {
      return mapHome(this);
    }
    return orElse();
  }
}

abstract class MapHome implements NavigationState {
  const factory MapHome(double i) = _$MapHome;

  @override
  double get i;
  @override
  $MapHomeCopyWith<MapHome> get copyWith;
}

abstract class $ShowLawyersCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory $ShowLawyersCopyWith(
          ShowLawyers value, $Res Function(ShowLawyers) then) =
      _$ShowLawyersCopyWithImpl<$Res>;
  @override
  $Res call({double i});
}

class _$ShowLawyersCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements $ShowLawyersCopyWith<$Res> {
  _$ShowLawyersCopyWithImpl(
      ShowLawyers _value, $Res Function(ShowLawyers) _then)
      : super(_value, (v) => _then(v as ShowLawyers));

  @override
  ShowLawyers get _value => super._value as ShowLawyers;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(ShowLawyers(
      i == freezed ? _value.i : i as double,
    ));
  }
}

class _$ShowLawyers with DiagnosticableTreeMixin implements ShowLawyers {
  const _$ShowLawyers(this.i) : assert(i != null);

  @override
  final double i;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationState.showLawyers(i: $i)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationState.showLawyers'))
      ..add(DiagnosticsProperty('i', i));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowLawyers &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(i);

  @override
  $ShowLawyersCopyWith<ShowLawyers> get copyWith =>
      _$ShowLawyersCopyWithImpl<ShowLawyers>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result mapHome(double i),
    @required Result showLawyers(double i),
    @required Result menu(double i),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return showLawyers(i);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result mapHome(double i),
    Result showLawyers(double i),
    Result menu(double i),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showLawyers != null) {
      return showLawyers(i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result mapHome(MapHome value),
    @required Result showLawyers(ShowLawyers value),
    @required Result menu(Menu value),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return showLawyers(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result mapHome(MapHome value),
    Result showLawyers(ShowLawyers value),
    Result menu(Menu value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showLawyers != null) {
      return showLawyers(this);
    }
    return orElse();
  }
}

abstract class ShowLawyers implements NavigationState {
  const factory ShowLawyers(double i) = _$ShowLawyers;

  @override
  double get i;
  @override
  $ShowLawyersCopyWith<ShowLawyers> get copyWith;
}

abstract class $MenuCopyWith<$Res> implements $NavigationStateCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  @override
  $Res call({double i});
}

class _$MenuCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(Menu _value, $Res Function(Menu) _then)
      : super(_value, (v) => _then(v as Menu));

  @override
  Menu get _value => super._value as Menu;

  @override
  $Res call({
    Object i = freezed,
  }) {
    return _then(Menu(
      i == freezed ? _value.i : i as double,
    ));
  }
}

class _$Menu with DiagnosticableTreeMixin implements Menu {
  const _$Menu(this.i) : assert(i != null);

  @override
  final double i;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationState.menu(i: $i)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationState.menu'))
      ..add(DiagnosticsProperty('i', i));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Menu &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(i);

  @override
  $MenuCopyWith<Menu> get copyWith =>
      _$MenuCopyWithImpl<Menu>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result mapHome(double i),
    @required Result showLawyers(double i),
    @required Result menu(double i),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return menu(i);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result mapHome(double i),
    Result showLawyers(double i),
    Result menu(double i),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (menu != null) {
      return menu(i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result mapHome(MapHome value),
    @required Result showLawyers(ShowLawyers value),
    @required Result menu(Menu value),
  }) {
    assert(mapHome != null);
    assert(showLawyers != null);
    assert(menu != null);
    return menu(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result mapHome(MapHome value),
    Result showLawyers(ShowLawyers value),
    Result menu(Menu value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (menu != null) {
      return menu(this);
    }
    return orElse();
  }
}

abstract class Menu implements NavigationState {
  const factory Menu(double i) = _$Menu;

  @override
  double get i;
  @override
  $MenuCopyWith<Menu> get copyWith;
}
