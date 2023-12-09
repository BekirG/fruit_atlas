import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/fruit_model.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  // Example FruitModel
  const testFruitModel = FruitModel(
    name: "Banana",
    id: 1,
    family: "Musaceae",
    order: "Zingiberales",
    genus: "Musa",
    nutritions: NutritionModel(
      calories: 96,
      fat: 0.2,
      sugar: 17.2,
      carbohydrates: 22.0,
      protein: 1.0,
    ),
  );

  // Test: Checking if FruitModel is a subclass of FruitEntity
  test('should be a subclass fruit entity', () async {
    // Assert: Checking if the tested model is a subclass of FruitEntity
    expect(testFruitModel, isA<FruitEntity>());
  });

  // Test: Returning a valid model from JSON
  test('should return a valid model from json', () async {
    // Arrange: Creating a map with dummy JSON data
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_fruit_response.json'));

    // Act: Creating a model from JSON using the fromJson method of FruitModel
    final result = FruitModel.fromJson(jsonMap);

    // Assert: Checking if the created model matches the expected model
    expect(result, equals(testFruitModel));
  });

  // Test: Checking if the model contains a proper JSON map
  test('should return a json map containing proper data', () async {
    // Act: Converting the model to a JSON map using the toJson method of FruitModel
    final result = testFruitModel.toJson();

    // Assert: Checking if the converted JSON map matches the expected JSON map
    final expectedJsonMap = {
      "name": "Banana",
      "id": 1,
      "family": "Musaceae",
      "order": "Zingiberales",
      "genus": "Musa",
      "nutritions": {
        "calories": 96,
        "fat": 0.2,
        "sugar": 17.2,
        "carbohydrates": 22.0,
        "protein": 1.0,
      },
    };

    expect(result, equals(expectedJsonMap));
  });
}
