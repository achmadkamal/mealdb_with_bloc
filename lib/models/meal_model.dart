import 'dart:convert';

MealModel mealModelFromJson(String str) => MealModel.fromJson(json.decode(str));
String mealModelToJson(MealModel data) => json.encode(data.toJson());

class MealModel {
  List<MealDetail> mealDetail;
  MealModel({required this.mealDetail});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        mealDetail: List<MealDetail>.from(
            json["meals"].map((x) => MealDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(mealDetail.map((x) => x.toJson())),
      };
}

class MealDetail {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;

  MealDetail({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) => MealDetail(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strInstructions: json["strInstructions"],
        strMealThumb: json["strMealThumb"],
      );

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
      };
}
