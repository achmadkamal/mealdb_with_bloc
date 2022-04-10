part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();
}

class MealLoadedEvent extends MealEvent {
  @override
  List<Object> get props => [];
}
