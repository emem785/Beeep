import 'package:beep/domain/Interface/api_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lawyer_tiles_state.dart';
part 'lawyer_tiles_cubit.freezed.dart';

@injectable
class LawyerTilesCubit extends Cubit<LawyerTilesState> {
  final ApiInterface apiInterface;
  Set<String> engagedLawyersIndex = Set<String>();
  LawyerTilesCubit({@required this.apiInterface})
      : super(LawyerTilesInitial({}));

  void engageLawyer(String index) {
    emit(LawyerSelected(index));
  }

  Future<void> confirmEngagement(String index) async {
    engagedLawyersIndex.add(index);
    final response = await apiInterface.hireLawyer(index);
    print(engagedLawyersIndex.toString());
    return response.map((r) => emit(LawyerEngaged(engagedLawyersIndex)));
  }

  void engagementNotConfirmed() {
    emit(LawyerTilesInitial(engagedLawyersIndex));
  }
}
