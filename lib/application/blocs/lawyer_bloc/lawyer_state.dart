part of 'lawyer_bloc.dart';

@immutable
@freezed
abstract class LawyerState with _$LawyerState{
  const factory LawyerState.initial() = Initial;
  const factory LawyerState.loading() = Loading;
  const factory LawyerState.error(Failure failure) = Error;
  const factory LawyerState.loaded(List<Lawyer> lawyers) = Loaded;
}
