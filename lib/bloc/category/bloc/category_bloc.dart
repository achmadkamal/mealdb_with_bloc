import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mealdb_with_bloc/models/mealcategory_model.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiService _apiService;

  CategoryBloc(this._apiService) : super(CategoryLoadingState()) {
    on<CategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final mealCategory = await _apiService.getMealCategory();
        emit(CategoryLoadedState(mealCategory));
      } catch (e) {
        emit(const CategoryErrorState('Sorry, system error occurred'));
      }
    });
  }
}
