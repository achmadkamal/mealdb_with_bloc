import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mealdb_with_bloc/models/meals_model.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final ApiService _apiService;
  final String category;

  MealsBloc(this._apiService, this.category) : super(MealsLoadingState()) {
    on<MealsEvent>((event, emit) async {
      emit(MealsLoadingState());
      try {
        final mealCategory = await _apiService.getMeals(category: category);
        emit(MealsLoadedState(mealCategory));
      } catch (e) {
        emit(const MealsErrorState('Sorry, system error occurred'));
      }
    });
  }
}
