import 'dart:async';
import 'dart:convert';

import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final UserLocationInterface userLocation;
  final ApiInterface apiInterface;
  final LocalStorageInterface localStorageInterface;
  StreamSubscription<Location> _subscription;

  MapBloc({
    @required this.userLocation,
    @required this.apiInterface,
    @required this.localStorageInterface,
  }) : super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield MapLoading();
    yield* event.map(getLocationBroadcast: (e) async* {
      final response = await localStorageInterface.getBuddy();
      final buddy =
          response.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
      final location = await apiInterface.getLocation(buddy.phonenumber).first;
      yield ReceivingBroadcast(
          buddy,
          apiInterface.getLocation(buddy.phonenumber).asBroadcastStream(),
          location);
    }, stopSecondBroadcast: (e) async* {
      yield BroadcastEnded();
    }, resumeSecondBroadcast: (e) async* {
      final response = await localStorageInterface.getBuddy();
      final buddy =
          response.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
      final location = await apiInterface.getLocation(buddy.phonenumber).first;
      yield ReceivingBroadcast(
          buddy,
          apiInterface.getLocation(buddy.phonenumber).asBroadcastStream(),
          location);
    });
  }
}
