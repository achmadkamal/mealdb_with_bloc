import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb_with_bloc/bloc/category/bloc/category_bloc.dart';
import 'package:mealdb_with_bloc/constant.dart';
import 'package:mealdb_with_bloc/pages/meals_page.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';
import '../custom_widgets/category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc(context.read<ApiService>())..add(CategoryLoadedEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainBrown,
          title: const Text(
            'Meal Category',
            style: TextStyle(color: kMainYellow),
          ),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: kLightYellow),
              );
            } else if (state is CategoryLoadedState) {
              return GridView.count(
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                children: state.mealCategory.categories
                    .map((e) => CategoryCardWidget(
                          mealName: e.strCategory,
                          mealImage: e.strCategoryThumb,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MealsPage(category: e.strCategory),
                              ),
                            );
                          },
                        ))
                    .toList(),
              );
            } else if (state is CategoryErrorState) {
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
