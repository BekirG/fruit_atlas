import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/core/error/exception.dart';
import 'package:fruit_atlas/core/error/failure.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/fruit_model.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/data/repositories/fruit_repository_imp.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  // Mocks and Instances
  late MockFruitRemoteDataSource mockFruitRemoteDataSource;
  late FruitRepositoryImpl fruitRepositoryImpl;

  // Setting up the test environment
  setUp(() {
    mockFruitRemoteDataSource = MockFruitRemoteDataSource();
    fruitRepositoryImpl =
        FruitRepositoryImpl(fruitRemoteDataSource: mockFruitRemoteDataSource);
  });

  // Example FruitModel and FruitEntity
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
  const testFruitEntity = FruitEntity(
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

  // Test group for 'get fruit info'
  group('get fruit info', () {
    // Test case: should return fruit when a call to data source is successful
    test('should return fruit when a call to data source is successful',
        () async {
      // Arrange: Mocking a successful response from the data source
      when(mockFruitRemoteDataSource.getFruitInfo("Banana"))
          .thenAnswer((_) async => testFruitModel);

      // Act: Calling the repository method to get fruit information
      final result = await fruitRepositoryImpl.getFruitInfo("Banana");

      // Assert: Checking if the result is as expected
      expect(result, equals(const Right(testFruitEntity)));
    });

    // Test case: should return server failure when a call to data source is unsuccessful
    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      // Arrange: Mocking a server exception from the data source
      when(mockFruitRemoteDataSource.getFruitInfo("Banana"))
          .thenThrow(ServerException());

      // Act: Calling the repository method to get fruit information
      final result = await fruitRepositoryImpl.getFruitInfo("Banana");

      // Assert: Checking if the result is a Left(ServerFailure)
      expect(result, equals(const Left(ServerFailure('An error has occured'))));
    });

    // Test case: should return connection failure when the device has no internet
    test('should return connection failure when the device has no internet',
        () async {
      // Arrange: Mocking a SocketException (no internet) from the data source
      when(mockFruitRemoteDataSource.getFruitInfo("Banana"))
          .thenThrow(const SocketException('Failed to connect to the network'));

      // Act: Calling the repository method to get fruit information
      final result = await fruitRepositoryImpl.getFruitInfo("Banana");

      // Assert: Checking if the result is a Left(ConnectionFailure)
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
