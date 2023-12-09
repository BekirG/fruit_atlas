import 'package:fruit_atlas/features/get_fruit/data/data_sources/remote/fruit_remote_data_source.dart';
import 'package:fruit_atlas/features/get_fruit/domain/repositories/fruit_repository.dart';
import 'package:fruit_atlas/features/get_fruit/domain/usecases/get_fruit_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

// Using annotations to generate mock classes
@GenerateMocks(
  [
    FruitRepository,
    FruitRemoteDataSource,
    GetFruitUseCase
  ],
  // Custom mock for http.Client
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  // This file serves as a placeholder for now, and you can add test cases later.
}
