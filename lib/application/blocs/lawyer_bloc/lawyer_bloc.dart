import 'dart:async';

import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:beep/core/error/failure.dart';
import 'package:beep/domain/Interface/api_interface.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lawyer_event.dart';
part 'lawyer_state.dart';
part 'lawyer_bloc.freezed.dart';

@injectable
class LawyerBloc extends Bloc<LawyerEvent, LawyerState> {
  final ApiInterface apiInterface;

  LawyerBloc({@required this.apiInterface}) : super(Initial());

  @override
  Stream<LawyerState> mapEventToState(
    LawyerEvent event,
  ) async* {
    yield Loading();
    yield* event.map(getLawyers: (l) async* {
      final response = await apiInterface.getLawyers();
      yield* response.fold((l) async* {
        yield Error(l);
      }, (r) async* {
        yield Loaded(r);
      });
    }, getBuddyLawyers: (b) async* {
      final response = await apiInterface.getBuddyLawyers();
      yield* response.fold((l) async* {
        yield Error(l);
      }, (r) async* {
        yield Loaded(r);
      });
    });
  }
}
