part of 'lawyer_tiles_cubit.dart';


@immutable
@freezed
abstract class LawyerTilesState with _$LawyerTilesState{
  const factory LawyerTilesState.initial(Set<String> engagedLawyersIndex) = LawyerTilesInitial;
  const factory LawyerTilesState.lawyerSelected(String index) = LawyerSelected;
  const factory LawyerTilesState.lawyerEngaged(Set<String> engagedLawyersIndex) = LawyerEngaged;
}