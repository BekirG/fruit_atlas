import 'package:dartz/dartz.dart';
import 'package:fruit_atlas/core/error/failure.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';

/// Abstract class defining the contract for interacting with fruit-related data in the domain layer.
///
/// This class declares a method to fetch information about a fruit by its name.
/// The method returns a [Right] containing a [FruitEntity] on success,
/// or a [Left] containing a [Failure] in case of an error.
abstract class FruitRepository {
  /// Fetches information about a fruit with the specified [fruitName].
  ///
  /// Returns a [Right] containing a [FruitEntity] on success.
  /// Returns a [Left] containing a [Failure] in case of an error.
  Future<Either<Failure, FruitEntity>> getFruitInfo(String fruitName);
}
