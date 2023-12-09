import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_atlas/core/error/exception.dart';
import 'package:fruit_atlas/core/error/failure.dart';
import 'package:fruit_atlas/features/get_fruit/data/data_sources/remote/fruit_remote_data_source.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';
import 'package:fruit_atlas/features/get_fruit/domain/repositories/fruit_repository.dart';

/// Implementation of [FruitRepository] responsible for coordinating data flow between
/// the domain layer and the remote data source ([FruitRemoteDataSource]).
///
/// Uses the provided [FruitRemoteDataSource] to fetch fruit information from a remote server.
class FruitRepositoryImpl extends FruitRepository {
  final FruitRemoteDataSource fruitRemoteDataSource;

  /// Constructs a [FruitRepositoryImpl] instance with the given [fruitRemoteDataSource].
  FruitRepositoryImpl({required this.fruitRemoteDataSource});

  /// Fetches information about a fruit with the specified [fruitName].
  ///
  /// Returns a [Right] containing a [FruitEntity] on success.
  /// Returns a [Left] containing a [ServerFailure] in case of a server error.
  /// Returns a [Left] containing a [ConnectionFailure] in case of a network error.
  @override
  Future<Either<Failure, FruitEntity>> getFruitInfo(String fruitName) async {
    try {
      // Attempt to fetch fruit information from the remote data source.
      final result = await fruitRemoteDataSource.getFruitInfo(fruitName);
      // Return a Right containing a FruitEntity on success.
      return Right(result.toEntity());
    } on ServerException {
      // Return a Left containing a ServerFailure in case of a server error.
      return const Left(ServerFailure('An error has occured'));
    } on SocketException {
      // Return a Left containing a ConnectionFailure in case of a network error.
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
