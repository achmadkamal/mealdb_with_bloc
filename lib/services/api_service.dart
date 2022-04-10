import 'package:http/http.dart' as http;
import 'package:mealdb_with_bloc/models/meal_model.dart';
import 'package:mealdb_with_bloc/models/mealcategory_model.dart';
import 'package:mealdb_with_bloc/models/meals_model.dart';

class ApiService {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<dynamic> getMealCategory() async {
    final url = Uri.parse('$_baseUrl/categories.php');
    final response = await http.get(url);
    final data = mealCategoryModelFromJson(response.body);
    if (response.statusCode == 200) {
      return data;
    }
  }

  Future<dynamic> getMeals({required String category}) async {
    final url = Uri.parse('$_baseUrl/filter.php?c=$category');
    final response = await http.get(url);
    final data = mealsModelFromJson(response.body);
    if (response.statusCode == 200) {
      return data;
    }
  }

  Future<dynamic> getMealDetail({required String name}) async {
    final url = Uri.parse('$_baseUrl/search.php?s=$name');
    final response = await http.get(url);
    final data = mealModelFromJson(response.body);
    if (response.statusCode == 200) {
      return data;
    }
  }
}
