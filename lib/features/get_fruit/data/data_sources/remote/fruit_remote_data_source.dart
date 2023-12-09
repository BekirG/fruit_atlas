import 'dart:convert';
import 'package:fruit_atlas/features/get_fruit/data/models/fruit_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';

/// Abstract class representing the remote data source for fruit-related information.
///
/// This class defines the contract for fetching fruit information from a remote server.
abstract class FruitRemoteDataSource {
  /// Fetches information about a fruit with the specified [name] from the remote server.
  ///
  /// Throws a [ServerException] if there is an issue with the server response.
  Future<FruitModel> getFruitInfo(String name);
}

/// Implementation of [FruitRemoteDataSource] for fetching fruit information from a remote server.
///
/// Uses the provided [http.Client] for making HTTP requests to the server.
class FruitRemoteDataSourceImpl extends FruitRemoteDataSource {
  final http.Client client;

  /// Constructs a [FruitRemoteDataSourceImpl] instance with the given [client].
  FruitRemoteDataSourceImpl({required this.client});

  @override
  Future<FruitModel> getFruitInfo(String name) async {
    // Make an HTTP GET request to the server's fruit info endpoint.
    final response = await client.get(Uri.parse(Urls.fruitInfoByName(name)));

    // Check if the server response status code is 200 (OK).

    if (response.statusCode == 200) {
      // Parse the response body using the FruitModel.fromJson method.
      return FruitModel.fromJson(json.decode(response.body));
    } else {
      // Throw a [ServerException] if there is an issue with the server response.
      throw ServerException();
    }
  }
}
