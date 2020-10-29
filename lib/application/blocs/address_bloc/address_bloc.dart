import 'dart:async';
import 'dart:convert';

import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/location_interface.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UserLocationInterface userLocationInterface;
  final ApiInterface apiInterface;
  final LocalStorageInterface localStorageInterface;
  AddressBloc(
      {this.apiInterface,
      this.localStorageInterface,
      this.userLocationInterface})
      : super(AddressInitial());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    yield AddressLoading();
    yield* event.map(getAddress: (e) async* {
      final address = await userLocationInterface.getAddressFromLocation();
      yield* address.fold((l) async* {
        yield AddressFailure();
      }, (r) async* {
        yield AddressGotten(r);
      });
    }, getBuddyAddress: (e) async* {
      final location = await _getBuddyLocation();
      final address =
          await userLocationInterface.getBuddyAddressFromLocation(location);
      yield* address.fold((l) async* {
        print("failure");
        yield AddressFailure();
      }, (r) async* {
        print(r);
        yield AddressGotten(r);
      });
    });
  }

  Future<Location> _getBuddyLocation() async {
    final response = await localStorageInterface.getBuddy();
    final buddy =
        response.fold((l) => null, (r) => Buddy.fromJson(jsonDecode(r)));
    final apiResponse = await apiInterface.getLocation(buddy.phonenumber);
    return apiResponse.fold(
        (l) => Location(latitude: 0, longitude: 0), (r) => r);
  }
}
