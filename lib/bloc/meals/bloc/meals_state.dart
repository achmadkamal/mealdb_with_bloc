part of 'meals_bloc.dart';

abstract class MealsState extends Equatable {
  const MealsState();
}

class MealsLoadingState extends MealsState {
  @override
  List<Object> get props => [];
}

class MealsLoadedState extends MealsState {
  final MealsModel meals;
  const MealsLoadedState(this.meals);

  @override
  List<Object> get props => [meals];
}

class MealsErrorState extends MealsState {
  final String error;
  const MealsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
