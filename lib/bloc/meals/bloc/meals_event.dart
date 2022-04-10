part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();
}

class MealsLoadedEvent extends MealsEvent {
  @override
  List<Object> get props => [];
}
