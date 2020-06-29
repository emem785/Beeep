part of 'lawyer_bloc.dart';

@immutable
@freezed
abstract class LawyerEvent with _$LawyerEvent{
  const factory LawyerEvent.getLawyers() = GetLawyers;
}