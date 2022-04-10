part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();
}

class MealLoadingState extends MealState {
  @override
  List<Object> get props => [];
}

class MealLoadedState extends MealState {
  final MealModel meal;
  const MealLoadedState(this.meal);

  @override
  List<Object> get props => [meal];
}

class MealErrorState extends MealState {
  final String error;
  const MealErrorState(this.error);

  @override
  List<Object> get props => [error];
}
