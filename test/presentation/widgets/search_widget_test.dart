import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/nutrition_model.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_bloc.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_event.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_state.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/widgets/fruit_info.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/widgets/search.dart';
import 'package:mocktail/mocktail.dart';

/// Mock implementation of the [FruitBloc] class.
class MockFruitBloc extends MockBloc<FruitEvent, FruitState> implements FruitBloc {}

/// Main test suite for the Fruit-related widgets and bloc interactions.
void main() {
  // Declare necessary variables.
  late MockFruitBloc mockFruitBloc;

  /// Set up method to initialize necessary instances before each test case.
  setUp(() {
    mockFruitBloc = MockFruitBloc();
    HttpOverrides.global = null;
  });

  /// Helper method to create a testable widget.
  Widget makeTestableWidget(Widget body) {
    return BlocProvider<FruitBloc>(
      create: (context) => mockFruitBloc,
      child: MaterialApp(home: body),
    );
  }

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

  /// Test case: Text field should trigger state to change from empty to loading.
  testWidgets('text field should trigger state to change from empty to loading',
      (widgetTester) async {
    // Arrange
    when(() => mockFruitBloc.state).thenReturn(FruitEmpty());

    // Act
    await widgetTester.pumpWidget(makeTestableWidget(const SearchWidget()));
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await widgetTester.enterText(textField, 'Banana');
    await widgetTester.pump();
    expect(find.text('Banana'), findsOneWidget);
  });

  /// Test case: Should show progress indicator when state is loading.
  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      // Arrange
      when(() => mockFruitBloc.state).thenReturn(FruitLoading());

      // Act
      await widgetTester.pumpWidget(makeTestableWidget(FruitInfoWidget()));

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  /// Test case: Should show widget containing fruit data when state is fruit loaded.
  testWidgets(
    'should show widget contain fruit data when state is fruit loaded',
    (widgetTester) async {
      // Arrange
      when(() => mockFruitBloc.state).thenReturn(const FruitLoaded(testFruitDetail));

      // Act
      await widgetTester.pumpWidget(makeTestableWidget(FruitInfoWidget()));

      // Assert
      expect(find.byKey(const Key('fruit_data')), findsOneWidget);
    },
  );
}
