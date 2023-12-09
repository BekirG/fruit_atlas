import 'package:fruit_atlas/features/get_fruit/data/data_sources/remote/fruit_remote_data_source.dart';
import 'package:fruit_atlas/features/get_fruit/data/repositories/fruit_repository_imp.dart';
import 'package:fruit_atlas/features/get_fruit/domain/repositories/fruit_repository.dart';
import 'package:fruit_atlas/features/get_fruit/domain/usecases/get_fruit_usecase.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


/// Singleton class responsible for managing the dependency injection using GetIt.
///
/// Use [setupLocator] function to initialize the service locator.
final locator = GetIt.instance;

/// Sets up the dependency injection for the application.
void setupLocator() {
  /// Registers the [FruitBloc] as a factory.
  locator.registerFactory(() => FruitBloc(locator()));

  /// Registers the [GetFruitUseCase] as a lazy singleton.
  locator.registerLazySingleton(() => GetFruitUseCase(locator()));

  /// Registers the [FruitRepositoryImpl] as a lazy singleton.
  locator.registerLazySingleton<FruitRepository>(
      () => FruitRepositoryImpl(fruitRemoteDataSource: locator()));

  /// Registers the [FruitRemoteDataSourceImpl] as a lazy singleton.
  locator.registerLazySingleton<FruitRemoteDataSource>(
      () => FruitRemoteDataSourceImpl(client: locator()));

  /// Registers the [http.Client] as a lazy singleton.
  locator.registerLazySingleton(() => http.Client());
}

