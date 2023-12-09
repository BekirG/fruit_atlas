import 'package:equatable/equatable.dart';

/// Base class for representing failures in the application.
///
/// A failure can occur for various reasons such as server errors,
/// connection issues, etc. This class extends [Equatable] to enable easy
/// comparison between different failure instances.
abstract class Failure extends Equatable {
  /// A descriptive message that provides more information about the failure.
  final String message;

  /// Constructs a [Failure] instance with the given [message].
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Represents a failure due to a server error.
///
/// This type of failure is typically thrown when there is an issue
/// communicating with the server or when the server returns an error response.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] instance with the given [message].
  const ServerFailure(String message) : super(message);
}

/// Represents a failure due to a connection issue.
///
/// This type of failure is typically thrown when there are problems with
/// network connectivity, preventing the application from reaching the server.
class ConnectionFailure extends Failure {
  /// Constructs a [ConnectionFailure] instance with the given [message].
  const ConnectionFailure(String message) : super(message);
}
