import 'package:fruit_atlas/features/get_fruit/domain/entities/nutrition_entity.dart';

/// Model class representing nutritional information of a fruit.
///
/// Extends [NutritionEntity] to ensure compatibility with the domain layer.
class NutritionModel extends NutritionEntity {
  const NutritionModel({
    /// Constructs a [NutritionModel] instance with the specified parameters.
    ///
    /// Parameters:
    /// - [calories]: The caloric content of the fruit.
    /// - [fat]: The fat content of the fruit.
    /// - [sugar]: The sugar content of the fruit.
    /// - [carbohydrates]: The carbohydrates content of the fruit.
    /// - [protein]: The protein content of the fruit.
    required final int calories,
    required final double fat,
    required final double sugar,
    required final double carbohydrates,
    required final double protein,
  }) : super(
            calories: calories,
            fat: fat,
            sugar: sugar,
            carbohydrates: carbohydrates,
            protein: protein);
  
  /// Factory method to create a [NutritionModel] instance from a JSON map.
  factory NutritionModel.fromJson(Map<String, dynamic> map) {
    return NutritionModel(
        calories: map['calories'],
        fat: map['fat'],
        sugar: map['sugar'],
        carbohydrates: map['carbohydrates'],
        protein: map['protein']);
  }
  
  /// Converts the [NutritionModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    "calories": calories,
    "fat": fat,
    "sugar": sugar,
    "carbohydrates": carbohydrates,
    "protein": protein
  };
}
