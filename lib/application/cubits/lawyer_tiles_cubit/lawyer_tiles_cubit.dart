import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lawyer_tiles_state.dart';
part 'lawyer_tiles_cubit.freezed.dart';

//TODO: Instead of using index use phone number as unique identifier
class LawyerTilesCubit extends Cubit<LawyerTilesState> {
  Set<int> engagedLawyersIndex = Set<int>();
  LawyerTilesCubit() : super(LawyerTilesInitial({}));

  void engageLawyer(int index) {
    emit(LawyerSelected(index));
  }

  void confirmEngagement(int index) {
    engagedLawyersIndex.add(index);
    print(engagedLawyersIndex.toString());
    emit(LawyerEngaged(engagedLawyersIndex));
  }

  void engagementNotConfirmed() {
    emit(LawyerTilesInitial(engagedLawyersIndex));
  }
}
