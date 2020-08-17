part of 'receive_beep_cubit.dart';


@immutable
@freezed
abstract class ReceiveBeepState with _$ReceiveBeepState{
  const factory ReceiveBeepState.initial() = ReceiveBeepInitial;
  const factory ReceiveBeepState.lawyersGotten() = ReceiveBeepLawyersGotten;
}