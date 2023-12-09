import 'package:dartz/dartz.dart';
import 'package:fruit_atlas/core/error/failure.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:fruit_atlas/features/get_fruit/domain/repositories/fruit_repository.dart';

/// Use case class responsible for executing the logic to retrieve fruit information.
///
/// Uses the [FruitRepository] to interact with the data layer and fetch fruit information
/// based on the provided [fruitName].
class GetFruitUseCase {
  final FruitRepository fruitRepository;

  /// Constructs a [GetFruitUseCase] instance with the given [fruitRepository].
  GetFruitUseCase(this.fruitRepository);

  /// Executes the use case to retrieve information about a fruit with the specified [fruitName].
  ///
  /// Returns a [Right] containing a [FruitEntity] on success.
  /// Returns a [Left] containing a [Failure] in case of an error.
  Future<Either<Failure, FruitEntity>> execute(String fruitName) {
    return fruitRepository.getFruitInfo(fruitName);
  }
}
