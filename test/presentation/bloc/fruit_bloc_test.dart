import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/core/error/failure.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_bloc.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_event.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_state.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../helpers/test_helper.mocks.dart';

/// Main test suite for the [FruitBloc] class.
void main() {
  // Declaring necessary variables.
  late MockGetFruitUseCase mockGetFruitUseCase;
  late FruitBloc fruitBloc;

  /// Set up method to initialize necessary instances before each test case.
  setUp(() {
    mockGetFruitUseCase = MockGetFruitUseCase();
    fruitBloc = FruitBloc(mockGetFruitUseCase);
  });

  // Test fruit details.
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

  // Test fruit name.
  const testFruitName = "Banana";

  /// Test case: Initial state should be empty.
  test('initial state should be empty', () {
    expect(fruitBloc.state, FruitEmpty());
  });

  /// Test case: Should emit [FruitLoading, FruitLoadFailure] when data is successfully retrieved.
  blocTest<FruitBloc, FruitState>(
    'should emit [FruitLoading, FruitLoadFailure] when data is gotten successfully',
    build: () {
      when(mockGetFruitUseCase.execute(testFruitName))
          .thenAnswer((_) async => const Right(testFruitDetail));
      return fruitBloc;
    },
    act: (bloc) => bloc.add(const OnFruitChanged(testFruitName)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      FruitLoading(),
      const FruitLoaded(testFruitDetail),
    ],
  );

  /// Test case: Should emit [FruitLoading, FruitLoadFailure] when data retrieval is unsuccessful.
  blocTest<FruitBloc, FruitState>(
    'should emit [FruitLoading, FruitLoadFailure] when data is unsuccessfully',
    build: () {
      when(mockGetFruitUseCase.execute(testFruitName))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return fruitBloc;
    },
    act: (bloc) => bloc.add(const OnFruitChanged(testFruitName)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      FruitLoading(),
      const FruitLoadFailure('Server failure'),
    ],
  );
}
