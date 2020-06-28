import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lawyer_event.dart';
part 'lawyer_state.dart';

class LawyerBloc extends Bloc<LawyerEvent, LawyerState> {
  @override
  LawyerState get initialState => LawyerInitial();

  @override
  Stream<LawyerState> mapEventToState(
    LawyerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
