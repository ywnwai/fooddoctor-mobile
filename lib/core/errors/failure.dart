/// A result the interface can show without exposing a data-source exception.
sealed class Failure {
  const Failure(this.message);

  final String message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
