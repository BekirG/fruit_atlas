import 'package:equatable/equatable.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';

/// Entity class representing fruit information in the domain layer.
///
/// Extends [Equatable] to enable easy comparison between different fruit entities.
class FruitEntity extends Equatable {
  /// Constructs a [FruitEntity] instance with the specified parameters.
  ///
  /// Parameters:
  /// - [name]: The name of the fruit.
  /// - [id]: The unique identifier of the fruit.
  /// - [family]: The family to which the fruit belongs.
  /// - [order]: The order to which the fruit belongs.
  /// - [genus]: The genus of the fruit.
  /// - [nutritions]: A [NutritionModel] instance representing the nutritional information of the fruit.
  const FruitEntity(
      {
      required this.name,
      required this.id,
      required this.family,
      required this.order,
      required this.genus,
      required this.nutritions});
  
  /// The name of the fruit.
  final String name;
  
  /// The unique identifier of the fruit.
  final int id;
  
  /// The family to which the fruit belongs.
  final String family;
  
  /// The order to which the fruit belongs.
  final String order;
  
  /// The genus of the fruit.
  final String genus;

  /// The nutritional information of the fruit.
  final NutritionModel  nutritions;

  @override
  
  List<Object?> get props => [name, id, family, order, genus, nutritions];
}
