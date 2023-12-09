import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';

/// Model class representing fruit information retrieved from a remote data source.
///
/// Extends [FruitEntity] to ensure compatibility with the domain layer.
class FruitModel extends FruitEntity {
  /// Constructs a [FruitModel] instance with the specified parameters.
  ///
  /// Parameters:
  /// - [name]: The name of the fruit.
  /// - [id]: The unique identifier of the fruit.
  /// - [family]: The family to which the fruit belongs.
  /// - [order]: The order to which the fruit belongs.
  /// - [genus]: The genus of the fruit.
  /// - [nutritions]: A [NutritionModel] instance representing the nutritional information of the fruit.
  const FruitModel({
    required final String name,
    required final int id,
    required final String family,
    required final String order,
    required final String genus,
    required final NutritionModel nutritions,
  }) : super(
            name: name,
            id: id,
            family: family,
            order: order,
            genus: genus,
            nutritions: nutritions);

  /// Factory method to create a [FruitModel] instance from a JSON map.
  factory FruitModel.fromJson(Map<String, dynamic> map) {
    return FruitModel(
        name: map['name'],
        id: map['id'],
        family: map['family'],
        order: map['order'],
        genus: map['genus'],
        nutritions: NutritionModel.fromJson(map['nutritions']));
  }

  /// Converts the [FruitModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "family": family,
        "order": order,
        "genus": genus,
        "nutritions": nutritions.toJson(),
      };

  /// Converts the [FruitModel] instance to a [FruitEntity] instance.
  FruitEntity toEntity() => FruitEntity(
        name: name,
        id: id,
        family: family,
        order: order,
        genus: genus,
        nutritions: nutritions,
      );
}
