import 'package:equatable/equatable.dart';
import 'package:fruit_atlas/features/get_fruit/domain/entities/fruit_entity.dart';

/// Abstract class representing states related to fruit features.
///
/// Extends [Equatable] to enable easy comparison between different state instances.
abstract class FruitState extends Equatable {
  const FruitState();

  @override
  List<Object?> get props => [];
}

/// Initial state representing the absence of fruit-related information.
class FruitEmpty extends FruitState {}

/// State representing that fruit-related information is currently being loaded.
class FruitLoading extends FruitState {}

/// State representing that fruit-related information has been successfully loaded.
///
/// Includes the [result], which is a [FruitEntity] containing the loaded information.
class FruitLoaded extends FruitState {
  final FruitEntity result;

  /// Constructs a [FruitLoaded] state with the specified [result].
  const FruitLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

/// State representing that there was a failure while loading fruit-related information.
///
/// Includes a [message] describing the nature of the failure.
class FruitLoadFailure extends FruitState {
  final String message;

  /// Constructs a [FruitLoadFailure] state with the specified [message].
  const FruitLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
