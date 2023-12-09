import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_atlas/core/constants/constants.dart';
import 'package:fruit_atlas/core/error/exception.dart';
import 'package:fruit_atlas/features/get_fruit/data/data_sources/remote/fruit_remote_data_source.dart';
import 'package:fruit_atlas/features/get_fruit/data/models/fruit_model.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/dummy_data/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  // Mock HTTP client and the implementation of the remote data source
  late MockHttpClient mockHttpClient;
  late FruitRemoteDataSourceImpl fruitRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    fruitRemoteDataSourceImpl =
        FruitRemoteDataSourceImpl(client: mockHttpClient);
  });

  // Test case for retrieving fruit information
  const testFruitName = "Banana";
  group('get fruit info', () {
    // Test for a successful response (HTTP 200)
    test('should return fruit model when the response code is 200', () async {
      // Arrange: Mock HTTP client's get method to return a successful response
      when(mockHttpClient.get(Uri.parse(Urls.fruitInfoByName(testFruitName))))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_fruit_response.json'), 200));

      // Act: Call the method to get fruit information
      final result =
          await fruitRemoteDataSourceImpl.getFruitInfo(testFruitName);

      // Assert: Check if the result is an instance of FruitModel
      expect(result, isA<FruitModel>());
    });

    // Test for an unsuccessful response (HTTP 404 or other)
    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      // Arrange: Mock HTTP client's get method to return a 404 response
      when(mockHttpClient.get(Uri.parse(Urls.fruitInfoByName(testFruitName))))
          .thenAnswer((_) async => http.Response('Not found', 404));

      // Act: Call the method to get fruit information
      final result =
           fruitRemoteDataSourceImpl.getFruitInfo(testFruitName);

      // Assert: Check if the result throws a ServerException
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
