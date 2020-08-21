part of 'lawyer_tiles_cubit.dart';


@immutable
@freezed
abstract class LawyerTilesState with _$LawyerTilesState{
  const factory LawyerTilesState.initial(Set<int> engagedLawyersIndex) = LawyerTilesInitial;
  const factory LawyerTilesState.lawyerSelected(int index) = LawyerSelected;
  const factory LawyerTilesState.lawyerEngaged(Set<int> engagedLawyersIndex) = LawyerEngaged;
}