part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final MealCategoryModel mealCategory;
  const CategoryLoadedState(this.mealCategory);

  @override
  List<Object> get props => [mealCategory];
}

class CategoryErrorState extends CategoryState {
  final String error;
  const CategoryErrorState(this.error);

  @override
  List<Object> get props => [error];
}
