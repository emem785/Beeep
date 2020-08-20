import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lawyer_tiles_state.dart';
part 'lawyer_tiles_cubit.freezed.dart';

class LawyerTilesCubit extends Cubit<LawyerTilesState> {
  List<int> engagedLawyersIndex = List<int>();
  LawyerTilesCubit() : super(LawyerTilesInitial());

  void engageLawyer(int index){
    engagedLawyersIndex.add(index);
    emit(LawyerEngaged(engagedLawyersIndex));
    print(engagedLawyersIndex.toString());
  }
}
