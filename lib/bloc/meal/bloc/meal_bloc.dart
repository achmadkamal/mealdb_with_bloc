import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mealdb_with_bloc/models/meal_model.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final ApiService _apiService;
  final String mealName;

  MealBloc(this._apiService, this.mealName) : super(MealLoadingState()) {
    on<MealEvent>((event, emit) async {
      emit(MealLoadingState());
      try {
        final mealCategory = await _apiService.getMealDetail(name: mealName);
        emit(MealLoadedState(mealCategory));
      } catch (e) {
        emit(const MealErrorState('Sorry, system error occurred'));
      }
    });
  }
}
