part of 'lawyer_tiles_cubit.dart';


@immutable
@freezed
abstract class LawyerTilesState with _$LawyerTilesState{
  const factory LawyerTilesState.initial() = LawyerTilesInitial;
  const factory LawyerTilesState.lawyerEngaged(List<int> engagedLawyersIndex) = LawyerEngaged;
}