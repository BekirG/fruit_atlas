import 'package:equatable/equatable.dart';

/// Abstract class representing events related to fruit features.
///
/// Extends [Equatable] to enable easy comparison between different event instances.
abstract class FruitEvent extends Equatable {
  const FruitEvent();

  @override
  List<Object?> get props => [];
}

/// Event representing a change in the selected fruit.
///
/// Extends [FruitEvent] and includes the [fruitName] that has been changed.
class OnFruitChanged extends FruitEvent {
  final String fruitName;

  /// Constructs an [OnFruitChanged] event with the specified [fruitName].
  const OnFruitChanged(this.fruitName);

  @override
  List<Object?> get props => [fruitName];
}

