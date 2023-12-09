import 'package:equatable/equatable.dart';

// Entity class representing nutritional information of a fruit in the domain layer.
///
/// Extends [Equatable] to enable easy comparison between different nutrition entities.
class NutritionEntity extends Equatable {
  /// The caloric content of the fruit.
  final int? calories;

  /// The fat content of the fruit.
  final double? fat;

  /// The sugar content of the fruit.
  final double? sugar;

  /// The carbohydrates content of the fruit.
  final double? carbohydrates;

  /// The protein content of the fruit.
  final double? protein;

  /// Constructs a [NutritionEntity] instance with the specified parameters.
  ///
  /// Parameters:
  /// - [calories]: The caloric content of the fruit.
  /// - [fat]: The fat content of the fruit.
  /// - [sugar]: The sugar content of the fruit.
  /// - [carbohydrates]: The carbohydrates content of the fruit.
  /// - [protein]: The protein content of the fruit.

  const NutritionEntity(
      {this.calories, this.fat, this.sugar, this.carbohydrates, this.protein});

  @override
  List<Object?> get props => [calories, fat, sugar, carbohydrates, protein];
}
