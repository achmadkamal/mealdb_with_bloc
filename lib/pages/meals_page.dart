import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb_with_bloc/constant.dart';
import 'package:mealdb_with_bloc/pages/mealdetail_page.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
import '../bloc/meals/bloc/meals_bloc.dart';
import '../custom_widgets/meals_widget.dart';

class MealsPage extends StatelessWidget {
  final String category;
  const MealsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsBloc(
        context.read<ApiService>(),
        category,
      )..add(MealsLoadedEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainBrown,
          title: Text(
            '$category Meals',
            style: const TextStyle(color: kMainYellow),
          ),
        ),
        body: BlocBuilder<MealsBloc, MealsState>(
          builder: (context, state) {
            if (state is MealsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: kLightYellow),
              );
            } else if (state is MealsLoadedState) {
              return GridView.count(
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: state.meals.meals
                    .map((e) => MealsCardWidget(
                          mealName: e.strMeal,
                          mealImage: e.strMealThumb,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealDetailPage(
                                  mealName: e.strMeal,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
              );
            } else if (state is MealsErrorState) {
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
