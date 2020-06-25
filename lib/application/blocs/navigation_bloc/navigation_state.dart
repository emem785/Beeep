part of 'navigation_bloc.dart';

@immutable
@freezed 
abstract class NavigationState with _$NavigationState{
  const factory NavigationState.mapHome(double i) = MapHome;
  const factory NavigationState.showLawyers(double i) = ShowLawyers;
  const factory NavigationState.menu(double i) = Menu;
}
