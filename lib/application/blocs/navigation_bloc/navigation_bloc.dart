import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(MapHome(0));


  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    switch (event.i) {
      case 1:
        yield ShowLawyers(300);
        break;
      case 2:
        yield Menu(0);
        break;
      default:
        yield MapHome(0);
    }
  }
}
