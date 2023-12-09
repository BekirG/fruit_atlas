import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:fruit_atlas/features/get_fruit/domain/usecases/get_fruit_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  // Test setup
  GetFruitUseCase? getFruitUseCase;
  MockFruitRepository? mockFruitRepository;

  // Setting up the test environment
  setUp(() {
    mockFruitRepository = MockFruitRepository();
    getFruitUseCase = GetFruitUseCase(mockFruitRepository!);
  });

  // Example FruitEntity and FruitName
  const testFruitDetail = FruitEntity(
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
  const testFruitName = "Banana";

  // Test case: should get fruit detail from the repository
  test('should get fruit detail from the repository', () async {
    // Arrange: Mocking a successful response from the repository
    when(mockFruitRepository!.getFruitInfo(testFruitName))
        .thenAnswer((_) async => const Right(testFruitDetail));

    // Act: Calling the use case to execute the operation
    final result = await getFruitUseCase!.execute(testFruitName);

    // Assert: Checking if the result is as expected
    expect(result, const Right(testFruitDetail));
  });
}
