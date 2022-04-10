import 'dart:convert';

MealCategoryModel mealCategoryModelFromJson(String str) =>
    MealCategoryModel.fromJson(json.decode(str));

String mealCategoryModelToJson(MealCategoryModel data) =>
    json.encode(data.toJson());

class MealCategoryModel {
  List<Category> categories;

  MealCategoryModel({required this.categories});

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) =>
      MealCategoryModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
