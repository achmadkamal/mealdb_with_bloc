import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb_with_bloc/constant.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
import '../bloc/meal/bloc/meal_bloc.dart';

class MealDetailPage extends StatelessWidget {
  final String mealName;
  const MealDetailPage({Key? key, required this.mealName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealBloc(
        context.read<ApiService>(),
        mealName,
      )..add(MealLoadedEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainBrown,
          title: const Text(
            'Meal Details',
            style: TextStyle(color: kMainYellow),
          ),
        ),
        body: BlocBuilder<MealBloc, MealState>(
          builder: (context, state) {
            if (state is MealLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: kLightYellow),
              );
            } else if (state is MealLoadedState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          state.meal.mealDetail[0].strMealThumb,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kMainBrown,
                        ),
                        child: Text(
                          state.meal.mealDetail[0].strMeal,
                          style: const TextStyle(
                            color: kLightYellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.meal.mealDetail[0].strCategory +
                            ' | ' +
                            state.meal.mealDetail[0].strArea,
                        style: const TextStyle(
                          color: kLightBrown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kLightYellow)
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          state.meal.mealDetail[0].strInstructions,
                          style: const TextStyle(color: kLightBrown),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is MealErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
