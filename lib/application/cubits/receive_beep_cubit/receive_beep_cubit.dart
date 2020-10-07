import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receive_beep_state.dart';
part 'receive_beep_cubit.freezed.dart';

class ReceiveBeepCubit extends Cubit<ReceiveBeepState> {
  ReceiveBeepCubit() : super(ReceiveBeepInitial());

  void getLawyers() {
    emit(ReceiveBeepLawyersGotten());
  }

  void hideLawyers() {
    emit(ReceiveBeepInitial());
  }
}
