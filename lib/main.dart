import 'package:flutter/material.dart';
import 'package:mealdb_with_bloc/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb_with_bloc/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiService(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
